Return-Path: <kernel-janitors+bounces-5918-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FFE997686
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Oct 2024 22:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D24E31C22A12
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Oct 2024 20:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416E11E04BF;
	Wed,  9 Oct 2024 20:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UpMHZsvG"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AC71714A4
	for <kernel-janitors@vger.kernel.org>; Wed,  9 Oct 2024 20:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728506287; cv=none; b=cuQH7a1pkuo3G7RYK21R/9S7eB5JEm2KKQU7vJSeMwSH1C5aJrs8vMo/3gkNLa/1i6/3ztxmj8/3QJY4SOWWsoKwYr0qDQkXMZOvyScgSO+IizFOWPBV6YO84IkIoVwbRIrMTsa5+mt84j4/J4GzaGBvGihnA/Z+ZCWBnKVDiUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728506287; c=relaxed/simple;
	bh=VxHJPPsb+ZJ9+ae9Pskv+JQEKeSJAaM0oYQXXJy26bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0EqSWy9/YNbktBTGBMcr8gUIOVUpn3qr8j1tjjK1bDE//49zTPmDucfyWw13hOfWogFfZnirW4jD790c75TiQ8q+S63ivvojhlMeDRpwIgvt4HT5PKp1ASDYTyC+ObXCnjCDhPFOdmMaVqPyT9w9RP+M8yyrF1tBeUNz0EcJWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UpMHZsvG; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-82ce1cd202cso9401839f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2024 13:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728506285; x=1729111085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4DQPDh/uckhA/EGGdJpkXIlABXFgh9zV11RflwXvPLE=;
        b=UpMHZsvGHTcLOD1mOrg8DrU3ZnH/hIf1oA059n1ED6lIaS4BfkEJkOL0MTlWuvkN0Z
         CegNBpf5pKHdR0U96D2F4vdAEcPHpeDWVuogZ/od89AQbOB0WCOd7qmj7WVPAhZ6YM3e
         FzqWv8t/UnuBtz4ruH/FHtt760shq+SkXJjPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728506285; x=1729111085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4DQPDh/uckhA/EGGdJpkXIlABXFgh9zV11RflwXvPLE=;
        b=Emt+w8RypK40IdhoqkkTfwXdirClv1JCqfzdZ4ADcFDGC29VuU88Mo5+vX6hGN00qM
         AHu84ciR0EmyytL/Z4QwwPahlm6lLeitcbcAHreIOKrynIMSrl8HYc7jVy5ufSjNc/Vh
         tkNTTKdE78X6IPiILNKZEstnaKrJ89BiJc9wYT2UfvYdk6MD/XgSzzq2vBNB+f3ZfB+s
         p/G3lRgoyr0M5IhtGikmnGOolZM/M7V97VciwR4uUT2qjsFjaPmijQJRO8wx4vO0NtrH
         hvAvtHmwW3na0nfg3zYI+vkcIUtZ2fBo9ESwwfoFmGcu1PtefOzYeCbsyIoL40Bya/RV
         Bscg==
X-Forwarded-Encrypted: i=1; AJvYcCXqQt4WWbRqLQ+izObEzVdpxgWPY6ztkRkD9ewyOZDPLVQN8+GBzZUtY7lPyDcCNOltgG/6NY9igSihIG3lx2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxBHaQ852KUdu2f8kcZxDBEhzL3XcEa704LQcbno6GlgZIZTC2
	2ppf+VSBxpTFbOHXD6r0KSx9OQyEdvkfXZNOltvN/WnNoyisgUqjdP3GBu/0JE4o5C8W90vFSrn
	L
X-Google-Smtp-Source: AGHT+IHTRmKs8xmn9OxeJmZEPasYJ8w2PdZycqNwlC2YZjRUHamwbqoDiDYGTDYUbehhmQ/friutCQ==
X-Received: by 2002:a05:6602:1595:b0:82c:bdec:1c0e with SMTP id ca18e2360f4ac-8353d378d0cmr378969839f.2.1728506285092;
        Wed, 09 Oct 2024 13:38:05 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dba8eed509sm179634173.80.2024.10.09.13.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 13:38:04 -0700 (PDT)
Message-ID: <018e525e-809c-4c69-a948-a1278af1ff2d@linuxfoundation.org>
Date: Wed, 9 Oct 2024 14:38:03 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] fs: Fix uninitialized scalar variable now
To: "Everest K.C." <everestkc@everestkc.com.np>, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20241009200528.36343-1-everestkc@everestkc.com.np>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241009200528.36343-1-everestkc@everestkc.com.np>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/24 14:05, Everest K.C. wrote:
> Variable `now` is declared without initialization. The variable
> could be accessed inside the if-else statements following the
> variable declaration, before it has been initialized.

It could be, but it isn't. I am not sure if this change is needed.
> 
> This patch initializes the variable to
> `inode_set_ctime_current(inode)` by default.

Instead of "This patch initializes", change it to "Initialize ..."
Do refer to submitting patches document for information on how
to write change logs.

> 
> This issue was reported by Coverity Scan.

Include the the error/report from Coverity.

> 
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---
>   fs/attr.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/fs/attr.c b/fs/attr.c
> index c614b954bda5..77523af2e62d 100644
> --- a/fs/attr.c
> +++ b/fs/attr.c
> @@ -284,7 +284,7 @@ EXPORT_SYMBOL(inode_newsize_ok);
>   static void setattr_copy_mgtime(struct inode *inode, const struct iattr *attr)
>   {
>   	unsigned int ia_valid = attr->ia_valid;
> -	struct timespec64 now;
> +	struct timespec64 now = inode_set_ctime_current(inode);
>   
>   	if (ia_valid & ATTR_CTIME) {
>   		/*
> @@ -293,8 +293,6 @@ static void setattr_copy_mgtime(struct inode *inode, const struct iattr *attr)
>   		 */
>   		if (ia_valid & ATTR_DELEG)
>   			now = inode_set_ctime_deleg(inode, attr->ia_ctime);
> -		else
> -			now = inode_set_ctime_current(inode);

The code is clear and easy to read the way it is since it handles both cases
and does appropriate initialization.


>   	} else {
>   		/* If ATTR_CTIME isn't set, then ATTR_MTIME shouldn't be either. */
>   		WARN_ON_ONCE(ia_valid & ATTR_MTIME);

I will leave it up to the maintainers to decide whether to take
this change or not.

thanks,
-- Shuah

