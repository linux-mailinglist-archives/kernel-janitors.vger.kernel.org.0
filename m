Return-Path: <kernel-janitors+bounces-9412-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F404BE1552
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Oct 2025 05:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A94DA351C0A
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Oct 2025 03:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122C015D5B6;
	Thu, 16 Oct 2025 03:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJ7oGRTY"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395D11CAA7B
	for <kernel-janitors@vger.kernel.org>; Thu, 16 Oct 2025 03:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760584339; cv=none; b=m0OK9PMJpuz5SbMq3AWw7wos1EYLlC5xn2sDWyBl5y6UN8V+C+4UiAibPyzhEw2thlvyNFr51X23nOD4K9n36sGGiV3Z1EFpPKsGDZcLKP3duH88qaewH/h3Rb3ah3yZu6Odq1uSnFjcu7nwTMOBx+XUWnF73/UM3cktrZgcPb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760584339; c=relaxed/simple;
	bh=FosbK3+mmiDc/+/euP2ZG1JXUgsZmpul+xmFj7RybeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ARtYBOfHMswTx93qO8j2yC/FmEyNGxbFtEJpHtMtzzudn9a+KXYiIhse7/lGcvA9aougSDJidQbRwbJmLWnKrYYfFTyoueGAcNyoNE089cxMT8U+jgW4nAJF/DnPqTEUXkK7lZF8JsM4LMbxcFERiMFBXfE87PoyfvEXNgk8Ftc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJ7oGRTY; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-78e4056623fso4026506d6.2
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Oct 2025 20:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584336; x=1761189136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEQXE06caMZeo5HYZoW0oDsuziZc3EuBAg1B8KF+blo=;
        b=cJ7oGRTYNYGo5taJhWyHlc73SKlNUgzpt5NlWHKnmoR/5tTokmNOxmo0uLhJUqp2Yi
         kOpH35ZVswLp3UfmTknl1SF38mDMfZ39a+5mBRNzhBmAViNW22ZNFYZ3TQVr8LtHRQX3
         pIsetqOXKwV91WMYzrgPrY4IwDtDydPnt6lRq+FIjynyFoePHYzAKA85WMzETo6Uttqw
         0jKpcSnyLPNwCY0vT5iILtjSr/kR3eILUSGF/Xztm7Yzxl4uA07vlsFiKvpVdE54VlY9
         AsaiJUX7RoUhQehpv2BZJgEhuxMfIQrUzvjzpxj0gogVPL/8yBKN9Bq2+LauRl52dY9h
         qUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584336; x=1761189136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEQXE06caMZeo5HYZoW0oDsuziZc3EuBAg1B8KF+blo=;
        b=KnTtOus1Rkb9DQQL0aAzQ+vWdLYyKtDBDhJOEnjQhCjrPXGLY7LyFpvnTGr2OP7Iwt
         Qgxbg0UHWauL5ju1GFHDm4/ZkLrf07/bQu5Kr6RD2lJ7I1l7iqDTAYC0iudNmGrSEjOh
         zsZ3lkRbZSOk//ueFYC7pwTQQuf0HS5j8MjD5tIPS0dV0i1vw1jgHUrNLTJaDgaWVW9M
         jypD877ocCDm/IZMhZhvg0m4D0m7tTcDhrexaq2mJ8A11v5GIIYFm2qf4uIGgskX0GKK
         eTJZpjorLqpjNoWuckPLWQ6dZtU+D1AWcF9ICPZIuMPM1Jma8BASs7pVjJD4c/gP4VhP
         U6/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyN0094aCNUBhsRWOmPmFaPwOW9vvsxRapHx08BEMUHsdd7YKPIAFVX784ho9sng8O43+jr9HztfqGt6GklB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFnTRntmz1GfCYITI7GxwpWvzpKCI6HPj8ePkUVVrVk5bQpti4
	NjdFj4rNFYmllzJWsNsIyIt3O4Lbor9u/dwqgKXVbCl/eTx+RJGmTeaZWWX0hS/yJWKYRMuWKOi
	o5JPlYGHuzVYbJd66abK2HkZYcxx+p+s=
X-Gm-Gg: ASbGncvRIR9tlSzO7DInfDsoUl7j33IWhcwH/kCeju4xW1aHFQ6ZIZHMnrmmy4w4Iiq
	eNCc8SN6ZHIAe7Au6dDfIXXSpudle43RH4ULuoXOz6MC7x29LGtIwfB3BRkAS8pqWm1N9OllXcj
	VIZqvg60JmteJPeG2nHhbHEy7XPLhpF8VBJ7nqCLn8QkFeqElbZVYFafyoqFMyo4qDCLo5qG7qd
	nIwFUREuXOlWjDfErsq5fmp25eNdZCqMN3vXUXd+CAL6ZvE4suwA/xfHNvwmd7O1Cz2Gh/5W561
	xD3JqN03zQJt6oJlQz3Kkavfl6qlO43/Lwh5uWBQWBOiYEULCXU07M5gfBFuUcTDePCUBMyvATL
	qkldvg8EAmsy3yhSPaGbTkvSB8BnhppK2ovwa+VEgkP/vdj7fygGUL/ghAUs+nn1EoDiOMmCVj4
	RvtC0keLmMgg==
X-Google-Smtp-Source: AGHT+IGAmXUQRmwsgVDvQbYvXojEsX7CJBtDld+dU6Sg9MvBtBJilFj4HbmhNlkERWRbsuIYDiCI/jX/pZLNTYS90MU=
X-Received: by 2002:ad4:5f89:0:b0:87c:b8f:f4f7 with SMTP id
 6a1803df08f44-87c0b8ff74amr32437746d6.29.1760584335852; Wed, 15 Oct 2025
 20:12:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aPBeBxTQLeyFl4mx@chcpu18>
In-Reply-To: <aPBeBxTQLeyFl4mx@chcpu18>
From: Steve French <smfrench@gmail.com>
Date: Wed, 15 Oct 2025 22:12:03 -0500
X-Gm-Features: AS18NWAEyWCeaVPeoVcoBEQpSJ9u0N2hnfc_WhSXLkxKfJqq1sbEBlBaJtOWFjY
Message-ID: <CAH2r5mtNVsFcMsW+=jdw4=hc4rssca-0fWMg4uhipBbuHnQ9GQ@mail.gmail.com>
Subject: Re: [PATCH v2] smb: client: Fix refcount leak for cifs_sb_tlink
To: Shuhao Fu <sfual@cse.ust.hk>
Cc: Steve French <sfrench@samba.org>, Markus Elfring <Markus.Elfring@web.de>, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, Bharath SM <bharathsm@microsoft.com>, 
	Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

updated the patch in cifs-2.6.git for-next

On Wed, Oct 15, 2025 at 9:53=E2=80=AFPM Shuhao Fu <sfual@cse.ust.hk> wrote:
>
> Fix three refcount inconsistency issues related to `cifs_sb_tlink`.
>
> Comments for `cifs_sb_tlink` state that `cifs_put_tlink()` needs to be
> called after successful calls to `cifs_sb_tlink()`. Three calls fail to
> update refcount accordingly, leading to possible resource leaks.
>
> Fixes: 8ceb98437946 ("CIFS: Move rename to ops struct")
> Fixes: 2f1afe25997f ("cifs: Use smb 2 - 3 and cifsacl mount options getac=
l functions")
> Fixes: 366ed846df60 ("cifs: Use smb 2 - 3 and cifsacl mount options setac=
l function")
> Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
> ---
> Change in v2:
> 1. improved patch wording
> 2. nicer goto label naming
>
> Link to v1: https://lore.kernel.org/linux-cifs/aOzRF9JB9VkBKapw@osx.local=
/
> ---
>  fs/smb/client/inode.c   | 6 ++++--
>  fs/smb/client/smb2ops.c | 8 ++++----
>  2 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
> index 239dd84a3..098a79b7a 100644
> --- a/fs/smb/client/inode.c
> +++ b/fs/smb/client/inode.c
> @@ -2431,8 +2431,10 @@ cifs_do_rename(const unsigned int xid, struct dent=
ry *from_dentry,
>         tcon =3D tlink_tcon(tlink);
>         server =3D tcon->ses->server;
>
> -       if (!server->ops->rename)
> -               return -ENOSYS;
> +       if (!server->ops->rename) {
> +               rc =3D -ENOSYS;
> +               goto do_rename_exit;
> +       }
>
>         /* try path-based rename first */
>         rc =3D server->ops->rename(xid, tcon, from_dentry,
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index 7c392cf59..00b3f769e 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -3212,8 +3212,7 @@ get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
>         utf16_path =3D cifs_convert_path_to_utf16(path, cifs_sb);
>         if (!utf16_path) {
>                 rc =3D -ENOMEM;
> -               free_xid(xid);
> -               return ERR_PTR(rc);
> +               goto put_tlink;
>         }
>
>         oparms =3D (struct cifs_open_parms) {
> @@ -3245,6 +3244,7 @@ get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
>                 SMB2_close(xid, tcon, fid.persistent_fid, fid.volatile_fi=
d);
>         }
>
> +put_tlink:
>         cifs_put_tlink(tlink);
>         free_xid(xid);
>
> @@ -3285,8 +3285,7 @@ set_smb2_acl(struct smb_ntsd *pnntsd, __u32 acllen,
>         utf16_path =3D cifs_convert_path_to_utf16(path, cifs_sb);
>         if (!utf16_path) {
>                 rc =3D -ENOMEM;
> -               free_xid(xid);
> -               return rc;
> +               goto put_tlink;
>         }
>
>         oparms =3D (struct cifs_open_parms) {
> @@ -3307,6 +3306,7 @@ set_smb2_acl(struct smb_ntsd *pnntsd, __u32 acllen,
>                 SMB2_close(xid, tcon, fid.persistent_fid, fid.volatile_fi=
d);
>         }
>
> +put_tlink:
>         cifs_put_tlink(tlink);
>         free_xid(xid);
>         return rc;
> --
> 2.39.5 (Apple Git-154)
>
>


--=20
Thanks,

Steve

