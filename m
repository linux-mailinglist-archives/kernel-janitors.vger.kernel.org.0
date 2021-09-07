Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3607E40253D
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Sep 2021 10:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242332AbhIGIkE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Sep 2021 04:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241391AbhIGIkD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Sep 2021 04:40:03 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B27C061757
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Sep 2021 01:38:56 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id r2so9182931pgl.10
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Sep 2021 01:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+nCpdOgVIRQsk4LFVtzynowlodPdmMjIIH75EckValY=;
        b=MfpSlX3gRuHZ8yjP0duQ15kI4yLC7y6QT0dwVq2SxKYOFGGF+s95tnQ2dCu2NH/HlA
         oY+qFZJscen0tcK9IsOWIDF69VXOks7Srje88EkkAg0ghamgKuWqYVOnAK5zdWbG32as
         3jBUokG4zS1rW7KeVRApLVsSCn5uYpcVvswnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+nCpdOgVIRQsk4LFVtzynowlodPdmMjIIH75EckValY=;
        b=Mc6+tHGTJKpkrHlBo+BoHXAZffGPC6GgZC+n8l7KkLQWbu5kbP84u9SAnytCaLIvhz
         3RwbhtZS96O64QslWOaoOfjXqyh99dKImq8ga2IoGiMKG56LwegOSseC3DSWx/es8mWJ
         YdNJai5THKiOMn1j11XeQHUGKjxiLIg5Wb/cX/fdhPJ8ElP+j3+3nPWycoxGmFoYr9qn
         n5asR2i+6ErG6e1qL5mJEQM5fZ6e96MUd/rZuis6Zo+jfZVxgdOl79gtvVdfUgxZlpAU
         04ulmA80yVAner+EJJ2YvjbMMJx70uDYGYfWBcWvU6EjYf8WYXX3Ds5ZPSPA8Y65vtut
         ppSg==
X-Gm-Message-State: AOAM532sSDVyQdJqOkPhqX1ptId8gTJHqDR2QIVhjM/DmH6T9+47luQD
        0QkYvU6zR0LXkryj9gzYy3rczA==
X-Google-Smtp-Source: ABdhPJxzmVq5GML8j7GNYiV8Z9skyx6xWjZ0mMbX9eRbN9rjmFoHUuv70pgiwqDJNSGhgd8T61klfA==
X-Received: by 2002:a63:5947:: with SMTP id j7mr15914828pgm.193.1631003935552;
        Tue, 07 Sep 2021 01:38:55 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:4040:44a5:1453:e72c])
        by smtp.gmail.com with ESMTPSA id p30sm9925472pfh.116.2021.09.07.01.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 01:38:54 -0700 (PDT)
Date:   Tue, 7 Sep 2021 17:38:50 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Namjae Jeon <linkinjeon@kernel.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Steve French <sfrench@samba.org>,
        Hyunchul Lee <hyc.lee@gmail.com>, linux-cifs@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ksmbd: potential uninitialized error code in
 set_file_basic_info()
Message-ID: <YTclGhwxhjHxODQz@google.com>
References: <20210907073340.GC18254@kili>
 <YTccRzi/j+7t2eB9@google.com>
 <CAKYAXd9rQU-u6q2ptqfGjFAND_VCRY4GqyF6th_b0u8Q__ckJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKYAXd9rQU-u6q2ptqfGjFAND_VCRY4GqyF6th_b0u8Q__ckJQ@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On (21/09/07 17:09), Namjae Jeon wrote:
> 2021-09-07 17:01 GMT+09:00, Sergey Senozhatsky <senozhatsky@chromium.org>:
> > On (21/09/07 10:33), Dan Carpenter wrote:
> >>
> >> Smatch complains that there are some paths where "rc" is not set.
> >>
> >> Fixes: eb5784f0c6ef ("ksmbd: ensure error is surfaced in
> >> set_file_basic_info()")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >> ---
> >>  fs/ksmbd/smb2pdu.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/fs/ksmbd/smb2pdu.c b/fs/ksmbd/smb2pdu.c
> >> index a350e1cef7f4..c86164dc70bb 100644
> >> --- a/fs/ksmbd/smb2pdu.c
> >> +++ b/fs/ksmbd/smb2pdu.c
> >> @@ -5444,7 +5444,7 @@ static int set_file_basic_info(struct ksmbd_file
> >> *fp, char *buf,
> >>  	struct file *filp;
> >>  	struct inode *inode;
> >>  	struct user_namespace *user_ns;
> >> -	int rc;
> >> +	int rc = 0;
> >>
> >>  	if (!(fp->daccess & FILE_WRITE_ATTRIBUTES_LE))
> >>  		return -EACCES;
> >
> > It sort of feels like that `rc' is not needed there at all. It's being used
> > in
> >
> >                rc = ksmbd_vfs_set_dos_attrib_xattr(user_ns,
> >                                                    filp->f_path.dentry,
> > &da);
> >                if (rc)
> >                       ksmbd_debug(SMB,
> >                                  "failed to restore file attribute in
> > EA\n");
> >
> > and in
> >
> >                rc = setattr_prepare(user_ns, dentry, &attrs);
> >                if (rc)
> >                         return -EINVAL;
> >
> > Either it should be used more, and probably be a return value, or we can
> > just remove it.
> This patch is correct. But I have already fixed it.
> You can understand it if you check #ksmbd-for-next branch, not master.
> 
> https://git.samba.org/?p=ksmbd.git;a=shortlog;h=refs/heads/ksmbd-for-next



I assume it's "ksmbd: ensure error is surfaced in set_file_basic_info()"


If none of the branches that set `rc' is taken then function returns
random stack value:

---

	int rc;

	if (test_share_config_flag(share, KSMBD_SHARE_FLAG_STORE_DOS_ATTRS) ... {
		rc = ...
	}

	if (attrs.ia_valid) .... {
		rc = ...
	}

	return rc;
---
