/*
 * Copyright (C) 2018 The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

int audioFeature_getEnable(int feature)
{
    if (feature == 8)
        return 1;
    return 0;
}
