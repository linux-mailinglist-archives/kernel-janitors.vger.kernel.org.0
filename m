Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 931A813240A
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Jan 2020 11:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727746AbgAGKpU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Jan 2020 05:45:20 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:32950 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgAGKpU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Jan 2020 05:45:20 -0500
Received: by mail-lj1-f194.google.com with SMTP id y6so46180152lji.0
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Jan 2020 02:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C9S9o2rObb9NcqGJD/gxTAUBsVVzEmnZ0vQA6P9vvWw=;
        b=n7E50cMJgd8ZK+yZ/PZ0NrJg9YxH73/VHIkmsyonXLf3Cso0z9KB2VFwWTOt9Xzf4B
         /zyNRQIA7ik+lq84fT/CQn5Pnv7PhEP8Hmsv3PNtGobLUkgNOhSYL/43dAMhUMA3LhHz
         HHTDjFubRwbxkD8SEXOm9Sqe9mdcAGeDLth39DRwfDqNDZZJdwoqKTKGlzsevGn2lQPN
         q/itCfr6qxQHTm92z1Sk5+eidwdUG6DhbY+aRn7rco7AKG6deXKKkgACqlgVjutT5NEG
         xO1Sgaf7yUSKLEsDHrQ0WeZKXr88aQnlH/kboi0n6fEmWtJq5n+Oo6+Q1VO8HG75H8W/
         vaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C9S9o2rObb9NcqGJD/gxTAUBsVVzEmnZ0vQA6P9vvWw=;
        b=gR6XuznJZSouOcyBL7Nfw12KWSokAb5HUeuZlBw7c02Wbggfzrxs11fp+Kwu3hTz0u
         pxnFWFysD6h8OZaG8rQOrbokA/hRS0msGCMJfj6sljWdWsgaBhc2qfUA2OrOqsLE92fz
         DFYPjhCuFpQlelHMuOTN4/s3LXw1jmQdCjQP3RuBSAJkzEC+ozuK94/vam7fe9RkWKUD
         GKn8I3y5xYrhDkCS34phQ/cD1TtWIWouJahxozmCPW0AAqDMwIr+Z1nd6lS0RN/SE2UB
         +d+19ZAdwh0U21RDAXPcoO16Dl1Hf53C01MlGJucfRu6yQmg+gCiSmiWoWSXH4or/Zp2
         GmdA==
X-Gm-Message-State: APjAAAXDrpL0qSp5OyW1YBLTHSj0OwPrq818OaU0rtj7heonrTMV6n53
        VOc9uMPKi1UZaizyI7KShaHzIW9qwjuOY+bad5jmkA==
X-Google-Smtp-Source: APXvYqwKhnJxUXNI6n4/K0m61QsBl8AZobfZ5X8p7GpweLe3H/vUr4fwKKptKn3Pmh8UUgxfJ2f+IKh6o3+WhaNxMvk=
X-Received: by 2002:a2e:85cd:: with SMTP id h13mr61274799ljj.191.1578393918200;
 Tue, 07 Jan 2020 02:45:18 -0800 (PST)
MIME-Version: 1.0
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr> <1577864614-5543-17-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-17-git-send-email-Julia.Lawall@inria.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:45:07 +0100
Message-ID: <CACRpkdZxQCfyWgWfFtnxo9wvV7z2d7jCLV5fBKW9wD2ZnQUp6A@mail.gmail.com>
Subject: Re: [PATCH 16/16] pinctrl: nuvoton: npcm7xx: constify copied structure
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jan 1, 2020 at 9:20 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:

> The npcmgpio_irqchip structure is only copied into another
> structure, so make it const.
>
> The opportunity for this change was found using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Patch applied.

Yours,
Linus Walleij
