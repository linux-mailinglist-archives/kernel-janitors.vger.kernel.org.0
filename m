Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1717BCF22E
	for <lists+kernel-janitors@lfdr.de>; Tue,  8 Oct 2019 07:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729876AbfJHFgm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 8 Oct 2019 01:36:42 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:34545 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729440AbfJHFgm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Oct 2019 01:36:42 -0400
Received: by mail-qt1-f194.google.com with SMTP id 3so23354437qta.1
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Oct 2019 22:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DLPHIzkkF9ezFThHyrTQhaKDEGQzpylYQSibbpf1y6w=;
        b=x33VxGlYwPV3fXI4CVn6TCAccWkMA7kLD8FTUj+N52IOu8oY1apGxB+P7yNm6SA74X
         iOIpxrjpy9L5HPubhg09DzBYM3Oe5QhHsC+rXQt+h04pgoymCWOsZwlEruxXI6hdf6DS
         QUkbSivkU4vQSlfsYbNGLFgyIxmmZzvySMK2mKv10Co8McU7Y+IApTBCVlwn+KJohNco
         FjwXflM9s2Ju/YWCrtFom9cvvA9OijB8o+MQ9DHITFw5AGYNfaH85DRQp/7+sh2+zcC5
         IOw65MbUGb3oitfVBO8MUVQnHnjEkrUGdNwNbmFbGEByl2/8TrKPB8bPmiZjhWtK0Qzl
         /qFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DLPHIzkkF9ezFThHyrTQhaKDEGQzpylYQSibbpf1y6w=;
        b=pexL3rBqxgt0Scwp2CSEXfohQ/MoHtR2zyR3b8fkUgwK4m8F7ztNo3BpUufP1rfPlI
         49xqrGmE+fYNc+LqEUyqaLNxaBSXzDMPMkwAbO8Ych7Nd/Udg9VwdO5ML50dhs2TRJh1
         YmPXHTyP6KTYA+WYPRYANxTsauNLMVZ7JEzUaTtrHLVqGQtd47qGIuvT3XEYBF2RnKzG
         un2p86vP7l55OxpZWrWmutk+W0c/CNDVRgA0QhGx5xYyFsXX6nsC6/MXd5WG+JmRK/e1
         eh6NM+c6Dpf5UU+DfuLscg7VYT3vueFFCWbMLLmA/McQlQ0jLY8w4fEAM9la/8aDMHjb
         r8Fg==
X-Gm-Message-State: APjAAAUKo1oKdr92MiWtUezKCxoO0UEALfsfS3mrOR9Btw4MlOPXUfOb
        Ygt341WK6K+lGYX1r79H1ZkqeAqw3qR8rVMVm+sWgg==
X-Google-Smtp-Source: APXvYqz8dIGmMGe1TLdQVwirABfPVreobcIApuOIty+3ZDrBFsZWTLpIwa9tc6FWtMb+EXNIAFtyVGGitAImVM3qyG8=
X-Received: by 2002:ac8:6796:: with SMTP id b22mr32097476qtp.95.1570513001536;
 Mon, 07 Oct 2019 22:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191007135313.8443-1-colin.king@canonical.com>
In-Reply-To: <20191007135313.8443-1-colin.king@canonical.com>
From:   Chris Chiu <chiu@endlessm.com>
Date:   Tue, 8 Oct 2019 13:36:28 +0800
Message-ID: <CAB4CAwdd-+Oq+qrFTzUmG39yNgd_+Zn2rii=mXWOJb5x+4VHYw@mail.gmail.com>
Subject: Re: [PATCH] rtl8xxxu: make arrays static, makes object smaller
To:     Colin King <colin.king@canonical.com>
Cc:     Jes Sorensen <Jes.Sorensen@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S . Miller" <davem@davemloft.net>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 7, 2019 at 9:53 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate const arrays on the stack but instead make them
> static. Makes the object code smaller by 60 bytes.
>
> Before:
>    text    data     bss     dec     hex filename
>   15133    8768       0   23901    5d5d realtek/rtl8xxxu/rtl8xxxu_8192e.o
>   15209    6392       0   21601    5461 realtek/rtl8xxxu/rtl8xxxu_8723b.o
>  103254   31202     576  135032   20f78 realtek/rtl8xxxu/rtl8xxxu_core.o
>
> After:
>    text    data     bss     dec     hex filename
>   14861    9024       0   23885    5d4d realtek/rtl8xxxu/rtl8xxxu_8192e.o
>   14953    6616       0   21569    5441 realtek/rtl8xxxu/rtl8xxxu_8723b.o
>  102986   31458     576  135020   20f6c realtek/rtl8xxxu/rtl8xxxu_core.o
>
> (gcc version 9.2.1, amd64)
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
Reviewed-by: Chris Chiu <chiu@endlessm.com>
