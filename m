Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8062EAD4B
	for <lists+kernel-janitors@lfdr.de>; Tue,  5 Jan 2021 15:21:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727396AbhAEOU5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 5 Jan 2021 09:20:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:46052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726625AbhAEOU4 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 5 Jan 2021 09:20:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A1CE22B2A
        for <kernel-janitors@vger.kernel.org>; Tue,  5 Jan 2021 14:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609856416;
        bh=8N6plM1j23UTnKQtyjPvKcNWup+TTrXuMvgzJn/tfcI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SNh1gxt6Tvwa1TfNiuFSDPCVZgL4ZCmCZ8bzfC8JzEJldpR3mkp7AqT3vvQkzwjIq
         UpUGGvoHTkxu6WE7jP7/1CpyCuC5Zu3PAlH+c1Y84vMkp03U4A3tHXagx5O3Fp189R
         b+MahRPYHulHNqRCrAqx511FEqgw5FxsOlNJF/oXutUq1NcSLy6oIuDxHmyNcoU7VF
         +hxjLFFqRC0/vzlmApGGhBAObrVje8JA3KLgrGlv2m5Tir/c+dQqp9kVcoZTl6nbtl
         Zu1sPdotncKp5bMCtC8Sa3bkAparNPxdnWILFgkeAwPccPad4+/fDytddhJV8ry+Jc
         sPBfBBNOTTgGg==
Received: by mail-ot1-f46.google.com with SMTP id j12so29341971ota.7
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Jan 2021 06:20:16 -0800 (PST)
X-Gm-Message-State: AOAM531/7u9i7pOmMAl2YBihSukFcFfHBIl/80qr39uA7wlSNQ5XdX/Y
        dYCXC6C00Y7NRE5QYoVh9a+64Xg98pbSaxLpC6Y=
X-Google-Smtp-Source: ABdhPJzWZhGmEiOC8monvUArry9q/k4DSTunaEOzIDFi61U4RHc6je1F4O83eXiecIeCdLY6rkIzSwkSsgKzgQdxU+8=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr56161713otm.305.1609856415452;
 Tue, 05 Jan 2021 06:20:15 -0800 (PST)
MIME-Version: 1.0
References: <X/RnUjY3XkZohk7w@mwanda>
In-Reply-To: <X/RnUjY3XkZohk7w@mwanda>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 5 Jan 2021 15:19:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2dGXh8VOdiG38hbJH9oFFUTE8P4p+53yOnh=tw+JoD2g@mail.gmail.com>
Message-ID: <CAK8P3a2dGXh8VOdiG38hbJH9oFFUTE8P4p+53yOnh=tw+JoD2g@mail.gmail.com>
Subject: Re: [PATCH] staging: vchiq: delete obselete comment
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marcelo Diop-Gonzalez <marcgonzalez@google.com>,
        Amarjargal Gundjalam <amarjargal16@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        kernel-janitors@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jan 5, 2021 at 2:19 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This comment describes a security problem which was fixed in commit
> 1c954540c0eb ("staging: vchiq: avoid mixing kernel and user pointers").
> The bug is fixed now so the FIXME can be removed.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

There is still another sparse warning for a remaining __user address
space mismatch in the driver, but this one seems to be fixed as you
say. Thanks for the fix!

      Arnd
