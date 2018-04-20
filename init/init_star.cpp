/*
   Copyright (C) 2018 The LineageOS Project
   SPDX-License-Identifier: Apache-2.0
 */

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

#include <android-base/properties.h>
#include <android-base/strings.h>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "vendor_init.h"
#include "property_service.h"

using android::base::GetProperty;
using android::init::property_set;

static void property_override(char const prop[], char const value[])
{
  prop_info *pi;

  pi = (prop_info *)__system_property_find(prop);
  if (pi)
    __system_property_update(pi, value, strlen(value));
  else
    __system_property_add(prop, strlen(prop), value, strlen(value));
}

static void apply_vendor_fingerprint()
{
  std::string fingerprint = GetProperty("ro.vendor.build.fingerprint", "");

  if (fingerprint.empty())
  {
    return;
  }

  char *dup = strdup(fingerprint.c_str());

  char *ch1 = strtok(dup, ":");
  char *ch2 = strtok(NULL, ":");
  char *ch3 = strtok(NULL, ":");

  free(dup);

  char *oem = strtok(ch1, "/");
  char *name = strtok(NULL, "/");
  char *device = strtok(NULL, "/");

  char *ver = strtok(ch2, "/");
  char *id = strtok(NULL, "/");
  char *pda = strtok(NULL, "/");

  char *type = strtok(ch3, "/");
  char *key = strtok(NULL, "/");

  char *description;
  asprintf(&description, "%s-%s %s %s %s %s", name, type, ver, id, pda, key);

  property_override("ro.build.description", description);
  property_override("ro.build.fingerprint", fingerprint.c_str());
  property_override("ro.product.name", name);
  property_override("ro.product.device", device);
  property_override("ro.build.PDA", pda);
}

static void apply_device_model()
{
  std::string model = GetProperty("ro.boot.em.model", "");

  if (model.empty())
  {
    return;
  }

  property_override("ro.product.model", model.c_str());
}

static void init_target_properties()
{
  apply_vendor_fingerprint();
  apply_device_model();
}

void vendor_load_properties()
{
  init_target_properties();
}
