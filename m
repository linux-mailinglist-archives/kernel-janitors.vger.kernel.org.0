Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08A033A2B1
	for <lists+kernel-janitors@lfdr.de>; Sun,  9 Jun 2019 03:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbfFIBZq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 8 Jun 2019 21:25:46 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:39525 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbfFIBZq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 8 Jun 2019 21:25:46 -0400
Received: by mail-vs1-f65.google.com with SMTP id n2so3367062vso.6
        for <kernel-janitors@vger.kernel.org>; Sat, 08 Jun 2019 18:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=UcAC8ImZDT6IxJqpP/p/TNBFLfK9lmk6hMLgiyxIpEs=;
        b=YKIP0rsn/nkYK8+FelI6mISilAOr8PSR4KWTiW1Q1ttdRI0/KT4p/VSoNK/ce/yP3l
         DQXQK4PYjsqs6fLHDL8pDDCH7F1lEs7AiVcEvq6rQDIt5EaS3acyHWEEcqYzrQWh18SS
         3atG+hB9BAZDaHU/MGZynTE8hh7k77ygpbaN4Wfb0pggUavsS5QrqoyFMqcEnQZuf2xj
         qSLXdgku/fv6ADzj9ycvioOxa5LrhhmvAer6wM8xo205Uj3NLbhtstgRUqa+dT+uv2sy
         g5OQDqGKbMLmCYFGPHCpBeK7pjaqtY7TQPoe/+P6OAA+s8evG+wSEkGSsa3L/mVtlkRd
         enyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=UcAC8ImZDT6IxJqpP/p/TNBFLfK9lmk6hMLgiyxIpEs=;
        b=flKvYN6cDR+K8v+UHiWR0AL29xWS48n4q5bIn1kCwkVSths3fWauG/4FarFhYsnOe4
         HgxIb/Jv5ItE2REY+84wRN6Ig0c5g4Y5obBq8AziYYwNd0Xh3yg0FY8Uy0MvSm9e7bIl
         JuMAtUTa1Gr0qYfrm4kueNgc9uC8o2ZZAy7o7Ct6vOKeMLIwFBJqOfpESkuwerpsQMbl
         p7x+ZIp8hVt8KD6zbNB89GvIR/YrLa4NutnuZhojO4DKROorizDVqlo24bCYGWyi6aSR
         P/+6k1WjjnycA1e2gMltzdi5gI4iiOOSjWGsi07drjnK02wtxvxcIDiZmjNqyI88uIWt
         GIBw==
X-Gm-Message-State: APjAAAUfFRLc+rsQGZC0KPVT7H5Qt4zUsJ7GQuYqYOajdC9O2Rpby8PU
        AZQnfMX1Tahvi5b3z/EySw9HH7Cx+AwsepbqqCbtQYTQ1oCfyg==
X-Google-Smtp-Source: APXvYqwiRva0Bd7yPkImOQ2G5P4rMV03aMr8HD3SVMgE68SrNjT3NSWeLDrgiJrppa7Ebrxu7syo4LJnBaVGmFzzzxo=
X-Received: by 2002:a67:ca0a:: with SMTP id z10mr16247659vsk.94.1560043545315;
 Sat, 08 Jun 2019 18:25:45 -0700 (PDT)
MIME-Version: 1.0
From:   Ming Yang <minos.future@gmail.com>
Date:   Sat, 8 Jun 2019 18:25:32 -0700
Message-ID: <CAEVNDXuse=mGXOzDFbCRuU8RgAVG8bWyW+3eR=2ouQUk+sdCag@mail.gmail.com>
Subject: 
To:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

subscribe kernel-janitors
