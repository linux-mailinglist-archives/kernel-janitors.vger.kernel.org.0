Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB25C2F822E
	for <lists+kernel-janitors@lfdr.de>; Fri, 15 Jan 2021 18:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733286AbhAORYZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 15 Jan 2021 12:24:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733221AbhAORYX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Jan 2021 12:24:23 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318FEC0613D3
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Jan 2021 09:23:43 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id dk8so10397975edb.1
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Jan 2021 09:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mJrsR9g+dyqkkVVvYtEu6xfD1Zo92dOcpjjoxvFadQo=;
        b=ge+GnUbEBLY+2evuY9Uj+uaN2jIYKWBKeP45kxv0m+2jXjz3M/6ABWkT/cxfrrGRq1
         4WNTMkLNR2uAeZ2AccElDyg/YHkMrBs/gGDoGct8UXXHPgz8PXATa6eEOBiANAdkuam1
         rp+M7bSxWpd33oqT8kvS3U/BVZaLAyBg8GWwIsNdEKl63eBd3Rn+7qjvCaDpG6I6LmIz
         ppYSC9rjrXDv9oNatkHLla47fsh0+pBergQGzDv+J33+ulldNGXUtGEltU+CgjYMpawp
         IWlLnc68w4znX2PD84B4cD1COJHGuLzY3SuktMfTPpHDLoXv9Lwn5inJdv8LgtDK3SN3
         jr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mJrsR9g+dyqkkVVvYtEu6xfD1Zo92dOcpjjoxvFadQo=;
        b=cTBs3ksTjgyZq5yOS6AWOLH3nsLkjIuiiiLI9yM12NyGM9VLmcSWvT5yFK2TxAqWPx
         r3VnhM59k3TXrEpcvV8g4z6aSbQgmwpgLM4WZB8XDIYBp31KeJtsJ/EnADPQgr+9Qsyj
         NqMH4S9Z72+51ul9TRD/XMa93XKODr4HdT4QwtmDcACL74LV6QiqzaYyWeJa4q4ejBui
         nxg9V0PtunTFPfgWmYl7Yx5Vl0uoE8eIqeoPqCF93vqsiDts2TGRYimu/tA+SMgHHT70
         NnR5WEG03O16tVJTtQMmYxOECs3XZ4sfH0c1/AQUvJUGcFQ2QkPcFFgyp2NCoyODRxzT
         68fw==
X-Gm-Message-State: AOAM532pjnH40zs297hXwtWBqS6K0Aonr1nao5asbH8Zr+nHDTA/k5vF
        4RUSTRX2TwcuA5PjdHQY1YpqGmDuUvI88DIf3ZSv47DUw+Kj
X-Google-Smtp-Source: ABdhPJxNJ1+S8LITVO12epfE1LpA0SxxE+7Im+Q6DiX6C3VsYyEebNuKAcm5/5AsziFCv15wGpFl9G0psW/zml1Wnk0=
X-Received: by 2002:a05:6402:ca1:: with SMTP id cn1mr10426635edb.128.1610731421674;
 Fri, 15 Jan 2021 09:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20210115120342.8849-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210115120342.8849-1-lukas.bulwahn@gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 15 Jan 2021 12:23:28 -0500
Message-ID: <CAHC9VhSfn9Ux_KcDysAH_vOWhiS3TvPYcXYZLg_5pr9Vee0f2g@mail.gmail.com>
Subject: Re: [PATCH] fs: anon_inodes: rephrase to appropriate kernel-doc
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Daniel Colascione <dancol@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Eric Biggers <ebiggers@google.com>,
        linux-fsdevel@vger.kernel.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jan 15, 2021 at 7:03 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit e7e832ce6fa7 ("fs: add LSM-supporting anon-inode interface") adds
> more kerneldoc description, but also a few new warnings on
> anon_inode_getfd_secure() due to missing parameter descriptions.
>
> Rephrase to appropriate kernel-doc for anon_inode_getfd_secure().
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  fs/anon_inodes.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)

Merged into selinux/next with the other related LSM/SELinux anon-inode
patches, thank you!

-- 
paul moore
www.paul-moore.com
