Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1254F175690
	for <lists+kernel-janitors@lfdr.de>; Mon,  2 Mar 2020 10:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgCBJGD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 2 Mar 2020 04:06:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:40394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727030AbgCBJGC (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 2 Mar 2020 04:06:02 -0500
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A786C24695
        for <kernel-janitors@vger.kernel.org>; Mon,  2 Mar 2020 09:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583139959;
        bh=9VyCf4dwGTnrVyn18Hp/Ohy02tvvPdNQE/X3kfntlnY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RiX3wDMJ46kkVuHSWbQKjkWSy11jZAaLO7C8Z/U/6Ky5Icg9S2osXVCc8nXfVfUFD
         kVXCIu0DBufbXSQG2JvotlP+YSymCPAUabZD3pTOAy2RkUWzKsMzgFECTiVNipaLBL
         m3vSYzKJrox/p0q9tbMwivsHdpY/H9QidnZQ7x30=
Received: by mail-wr1-f51.google.com with SMTP id l5so11487180wrx.4
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Mar 2020 01:05:59 -0800 (PST)
X-Gm-Message-State: ANhLgQ2uRmptq6v15QVKZSSM46rUlKPb/GO4OMKCr1G/4t6yh5alrZ/A
        rLXF7g46jxgwgUZq2e4w9IGlyM4uXv05J9UuS8+Zew==
X-Google-Smtp-Source: ADFU+vsJ1MsogAG7JWBk0KsbC6ingwVKpcNrmJm/CtOg8fMZzkADZRUnDDKZ9pMMuCZbkETade0v13pKbGcH+k5atmE=
X-Received: by 2002:a5d:6051:: with SMTP id j17mr1272058wrt.151.1583139958096;
 Mon, 02 Mar 2020 01:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20200301155748.4788-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200301155748.4788-1-lukas.bulwahn@gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 2 Mar 2020 10:05:47 +0100
X-Gmail-Original-Message-ID: <CAKv+Gu_gCqMO89wQ8RTwveBMDu-vdwhS5anPiZzQHdViygEouQ@mail.gmail.com>
Message-ID: <CAKv+Gu_gCqMO89wQ8RTwveBMDu-vdwhS5anPiZzQHdViygEouQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust EFI entry to removing eboot.c
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-efi <linux-efi@vger.kernel.org>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 1 Mar 2020 at 16:58, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit c2d0b470154c ("efi/libstub/x86: Incorporate eboot.c into libstub")
> removed arch/x86/boot/compressed/eboot.[ch], but missed to adjust the
> MAINTAINERS entry.
>
> Since then, ./scripts/get_maintainer.pl --self-test complains:
>
>   warning: no file matches F: arch/x86/boot/compressed/eboot.[ch]
>
> Rectify EXTENSIBLE FIRMWARE INTERFACE (EFI) entry in MAINTAINERS.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Ard, please pick this patch for your linux-next branch.
> applies cleanly on next-20200228, do not apply on current master
>
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>

Thanks Lukas, I'll queue this up.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 09b04505e7c3..4ce510b8467a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6383,7 +6383,6 @@ T:        git git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git
>  S:     Maintained
>  F:     Documentation/admin-guide/efi-stub.rst
>  F:     arch/*/kernel/efi.c
> -F:     arch/x86/boot/compressed/eboot.[ch]
>  F:     arch/*/include/asm/efi.h
>  F:     arch/x86/platform/efi/
>  F:     drivers/firmware/efi/
> --
> 2.17.1
>
