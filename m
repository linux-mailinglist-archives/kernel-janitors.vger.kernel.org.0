Return-Path: <kernel-janitors+bounces-5151-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB154962858
	for <lists+kernel-janitors@lfdr.de>; Wed, 28 Aug 2024 15:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A5B8283B65
	for <lists+kernel-janitors@lfdr.de>; Wed, 28 Aug 2024 13:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49850186284;
	Wed, 28 Aug 2024 13:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pv4EmUsP"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAD2178CF2
	for <kernel-janitors@vger.kernel.org>; Wed, 28 Aug 2024 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724850809; cv=none; b=UQa4Ial33ogG1xyf9w34UgE9kTacKa4WIV+ia5mTF6cXGLQcFOYXJ+l8zr2eeSM5u+velqw0C8L0FV8q+qt3qj1iZORqBXxAW0NAV2Igy0xatThGfyuCEh1q8NHoyICHfTlpJJU8tTrVk1OljhBHJwmcnM97ZKErvXX5+kUI4Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724850809; c=relaxed/simple;
	bh=c/zc+UsOMGU7+W7R+4O3camx+C1Cz8Nz25luYqSOAOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAaPJ91LH7X0oVg/WHMITGBgbSYG1Tm7tm2qkEQY/KkuaC9nX9UiJ8p5ZrzSVujCPDg2o/fS1XB5pTGnXSdQ08nfNn3e5tIKQapPPOVoBlLYLo7+oqvtHFKrqC4MaZsqnli1bAlYXHX0/VwyP1A1GWr5TDxzJu/IqZtXn2YXnJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pv4EmUsP; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3719896b7c8so3526175f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Aug 2024 06:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724850806; x=1725455606; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oKFxTdVhG0vl9VERtDu2+jX5SZIfs0u5rZfANIo5dLc=;
        b=Pv4EmUsPR+RhkhJm3FqTYbbdMUR44zZK4F5eddJyZ4O3QO/mjkjsj5kR5HaKr8NswT
         sok37IC+taVc23VsrZ6A2Fp08lNSoOjsCtKuH2v1qYqZIftQBu630JZS1bG5ULB3GBsD
         6rRcIaXVPc48oT0RQgjR5y4B0MdhN6BYCLQ99ugKUOIERbtFjQkJRGk5vX2UmEL7aPlc
         niCGA+Z7xOqOtmE1a1FpzJbM1qDf3xdFB1bS5mgeWDQ0VLskN+HK4sh0BiduKvEXr4ro
         9txj3RGfG2glD0kusqc2WBt7eGyUAc4TRqett87tauG0zO4YCKTyW+Oae/s7rIWvm6zo
         LxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724850806; x=1725455606;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oKFxTdVhG0vl9VERtDu2+jX5SZIfs0u5rZfANIo5dLc=;
        b=lpOhHlP9nHyF8QTZ7Ig/wVpywj4QoYzL0VIbHIT98Ttll/PF5+rM1Ift4/TpW1YDKN
         zoMI2R2Yii9uhAv7WsiA9w6kToH4C5wSvIupu7AhZudDN2fonBrPpEU7OjPb6bgIxjH/
         q714e2P1uvkkhVgDgRaS0jgNsqz4RjBN91OcQsegQ/TzArx5jrOaMWcM8IXx2AucobqK
         oDh/qRz8t6zIbQZBgKgDnWCQfGLkYtcdt+JVIeGh1sInTXP+vGkyt+ej157YeWQiMuJe
         AefpldNpc1pJjiQWbEqKPmd6xLFMsKq1chfpKINXGHQBhXklfk/OEgRRYsa0I26Sx/q6
         0uTw==
X-Forwarded-Encrypted: i=1; AJvYcCWa5f8IiYq/E/VqcrHFG+L5TsnBjTKgPdd0MqU9ekOmuvqYeUiqoLvpUGs8n4uAFK2pyb4jAfmhx/8egFLPg5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YymgI4WsZ3Xr5T5Ggot47NP3t+nbGN22QTof7hQjbII1h84WobF
	6dm7n1Ok2taqCHgkUzGomljc71DIS0IzbUOUU/6nkrwwAeyP4X6uz8SGX135lGQ=
X-Google-Smtp-Source: AGHT+IGG2FnZQPb+umi9NbaPw0r2wgnClzF57CwQ4CjBjoGjUZ26/eTfZhl9zE3dVOSPHBTGIqLBeg==
X-Received: by 2002:adf:f7c9:0:b0:367:9575:2820 with SMTP id ffacd0b85a97d-373118d12a4mr10702272f8f.45.1724850805948;
        Wed, 28 Aug 2024 06:13:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110603sm15621246f8f.2.2024.08.28.06.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 06:13:25 -0700 (PDT)
Date: Wed, 28 Aug 2024 16:13:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Li Zetao <lizetao1@huawei.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] btrfs: Fix reversed condition in
 copy_inline_to_page()
Message-ID: <5a19b8a7-385c-4616-a5b7-212e19c9ddc1@stanley.mountain>
References: <3a05145b-6c24-4101-948e-1a457b92ea3e@stanley.mountain>
 <40421bdb-4573-4768-8d6d-39b0d0df9260@huawei.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40421bdb-4573-4768-8d6d-39b0d0df9260@huawei.com>

On Wed, Aug 28, 2024 at 08:53:44PM +0800, Li Zetao wrote:
> Hi Dan,
> 
> 在 2024/8/27 18:21, Dan Carpenter 写道:
> > This if statement is reversed leading to locking issues.
> > 
> > Fixes: 8e603cfe05f0 ("btrfs: convert copy_inline_to_page() to use folio")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > This patch is obviously correct but it's from static analysis so additional
> > testing would be good as well.
> > 
> >   fs/btrfs/reflink.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/btrfs/reflink.c b/fs/btrfs/reflink.c
> > index 1681d63f03dd..f0824c948cb7 100644
> > --- a/fs/btrfs/reflink.c
> > +++ b/fs/btrfs/reflink.c
> > @@ -146,7 +146,7 @@ static int copy_inline_to_page(struct btrfs_inode *inode,
> >   	btrfs_folio_clear_checked(fs_info, folio, file_offset, block_size);
> >   	btrfs_folio_set_dirty(fs_info, folio, file_offset, block_size);
> >   out_unlock:
> > -	if (IS_ERR(folio)) {
> > +	if (!IS_ERR(folio)) {
> This is a mistake caused by my carelessness,thank you for the patch
> >   		folio_unlock(folio);
> >   		folio_put(folio);
> >   	}
> 
> Can I merge your patch into my patchset and add you as a co-author?

Just merge it.  No need for co-author credit for something tiny like this.  :P

regards,
dan carpenter


