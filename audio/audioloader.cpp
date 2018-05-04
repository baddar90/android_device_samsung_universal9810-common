/*
 * Copyright (C) 2018 The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#include <media/AudioSystem.h>

int main(int, char**)
{
    android::AudioSystem::setParameters(0, android::String8("Dualspk=1"));
    android::AudioSystem::setParameters(0, android::String8("SpkAmpLPowerOn=1"));
    android::AudioSystem::setParameters(0, android::String8("ProximitySensorClosed=0"));
    return 0;
}
