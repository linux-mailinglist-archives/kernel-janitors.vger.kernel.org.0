Return-Path: <kernel-janitors+bounces-4885-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5BA94347B
	for <lists+kernel-janitors@lfdr.de>; Wed, 31 Jul 2024 18:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B95AF1F2410C
	for <lists+kernel-janitors@lfdr.de>; Wed, 31 Jul 2024 16:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59D21BD510;
	Wed, 31 Jul 2024 16:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MZVvajiU"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF611BD4F8
	for <kernel-janitors@vger.kernel.org>; Wed, 31 Jul 2024 16:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722444783; cv=none; b=QufsuLMjQ9bMuWrRrRGp2T2H439ihqd8hvDKVowM5F/jhBduMDSLtX63Y6FYf3XNXkSEuE3ap+3zBOhWeupIcFe7rdbajLubJc4BDj88WSmUb7G9TQPfJhjk5YwqtUb2LtYS9ljiCskUwAMo/YdW4L0SEgrIM1xZezi7PckiNjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722444783; c=relaxed/simple;
	bh=p2sS8yeAfKz1EFKTG0yaZjGwZSGTkLx/gd6yviKg1To=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gx9iS2B1wcCqvzYmT4KomF8QVLrZtT74xlW26W24UYmXRDWv5rgtJz6MKNJStL5xnFTxmsEciZW/JqQDEZXwLa5laP1q+9R7b2fc51mYk0B9FEQUh+Ifbvs5JZkkVMeMrM+IX/sMrj/0IM2wFkNffF3HoEh6PsjOZDfV2oJKhO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MZVvajiU; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3db1e21b0e4so3840460b6e.2
        for <kernel-janitors@vger.kernel.org>; Wed, 31 Jul 2024 09:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722444780; x=1723049580; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tL+HD2Ty8QZCeLBha1Q7mgorf+VkCmmM0sjUkwiPvkQ=;
        b=MZVvajiUzW4CX6sJ+VyQerBELOIgpiR3dgpz21kVGXur2ylQh0QBWZXInPz9YhKqRU
         Gzm4ScRh4IF7a+cIO20LPkRv7Ecqr/IVJquGdnOrX96LXJVFSC0TCPeYDQIb018cdFqN
         q6G2ri6VqU+bNDxDrMXh5rnv7acTifSQ5OWG/EZUH/c6Ym7gkkRTf38pVvAUeFfjnA8x
         l2zdTn738cAC68wHldbUrUIxyUiZe3Q2otbBlixnqUy3oN+em2MdELJEatCP0APCJl7x
         LFjObHeU/HyYzcf2gpTTVBYvKdFmySXoEQ8VYzPcV+z8KWO6rAedDNQMYz/mT88Og0Pj
         tWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722444780; x=1723049580;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tL+HD2Ty8QZCeLBha1Q7mgorf+VkCmmM0sjUkwiPvkQ=;
        b=cDAlsYecrFSqH/MMEHN++2Eoo85KugEQGLuIJnUPsz3Y+hWXgG3a9fTw7AFZlsw2pA
         IiFuwd73iu+rBVP1z0z2Hehp+Kjbl5Qtx1YyNli+xZiRjN6oXIU4UvPIT1Cs/KWdFMF7
         VdQjtoAc8J81b+P30Ui5oQmrjwQbIOXNEOv/o8Bw+xIzbUihcPxq93PURNg3NmM3mv0f
         3MW2gwwClfq74QfnRsnFeQ/j7+9UhsG7aZK31ImI0cynEjFujOmtOxvwpTKvS5smcA3f
         w9HZPssGI0uO8JESmMIHj/tMADnFgg1m2q+7Zdn+xPHSNQkKChOR/AZ9PQGXHZF9RGwz
         H2/A==
X-Forwarded-Encrypted: i=1; AJvYcCUARMXGbZxdkc+lSPrJN/i1OTn4l7ZdCUSyufsf0vjpN89RBSrrGmSK0FOwpN8MJTJViNk8zu4M4Sp95mq+TE/miBvl0M+spJZPB7Sg8bCb
X-Gm-Message-State: AOJu0Yx+eBo6/wciaAabdRME1l4hBh6VkFrZfk/iUy1WX56HcHW16D2s
	CXikKKAmuoJeS1/nHiag/8d7lf1O9gBGWurNho6Uro2S7uDxDA+mN0G4Yl2T1/U=
X-Google-Smtp-Source: AGHT+IHKBM7a5C9ptGZgwKLnC41lsDOJwwxGZd3BgpTmfrkacVPR3KuytmKPy41jfkQOTPMuaT4IMw==
X-Received: by 2002:a05:6808:d46:b0:3db:1872:f22a with SMTP id 5614622812f47-3db238a73b5mr18885800b6e.23.1722444780524;
        Wed, 31 Jul 2024 09:53:00 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:c572:4680:6997:45a1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db418058b7sm746216b6e.24.2024.07.31.09.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 09:53:00 -0700 (PDT)
Date: Wed, 31 Jul 2024 11:52:58 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
	linux-bcachefs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] bcachefs: Kill opts.buckets_nouse
Message-ID: <2f4977d6-7f57-468c-af17-bc521b1121e1@suswa.mountain>
References: <31ed13c7-7a14-4693-a9cc-fdb078a3c412@stanley.mountain>
 <x3nici64pxcqqhcngceu2nbtemc64bbirss7fbaeuxk7orjwuc@oxixb5xee5n2>
 <4f8f1e94-2d5f-46e9-8860-af54f522dc94@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f8f1e94-2d5f-46e9-8860-af54f522dc94@wanadoo.fr>

On Wed, Jul 31, 2024 at 06:46:39PM +0200, Christophe JAILLET wrote:
> Le 31/07/2024 � 00:23, Kent Overstreet a �crit�:
> > On Tue, Jul 30, 2024 at 02:45:17PM GMT, Dan Carpenter wrote:
> > > Hello Kent Overstreet,
> > > 
> > > Commit ffcbec607613 ("bcachefs: Kill opts.buckets_nouse") from Apr 6,
> > > 2024 (linux-next), leads to the following Smatch static checker
> > > warning:
> > > 
> > > 	fs/bcachefs/super.c:1202 bch2_dev_free()
> > > 	warn: 'ca->buckets_nouse' double freed
> > 
> > yup, that's a bug
> > 
> > -- >8 --
> > Subject: [PATCH] bcachefs: Fix double free of ca->buckets_nouse
> > 
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Fixes: ffcbec6076 ("bcachefs: Kill opts.buckets_nouse")
> > Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
> > 
> > diff --git a/fs/bcachefs/super.c b/fs/bcachefs/super.c
> > index 0542953a7a..6d0ce3d734 100644
> > --- a/fs/bcachefs/super.c
> > +++ b/fs/bcachefs/super.c
> > @@ -1195,7 +1195,6 @@ static void bch2_dev_free(struct bch_dev *ca)
> >   	if (ca->kobj.state_in_sysfs)
> >   		kobject_del(&ca->kobj);
> > -	kfree(ca->buckets_nouse);
> 
> Hi,
> 
> unrelated, but apparently this should also have been kvfree().
> 
> Dan, do you already have a check for such cases where kvfree() or kfree()
> are called when the other one should be used instead?
> 

No.  I don't.  I've been meaning to write one...

KTODO: write a smatch check for calling kfree instead of kvfree()

I'll probably do it in the next week or two.  The min/max changes are
higher priority right now.  :P  #painful

regards,
dan carpenter


