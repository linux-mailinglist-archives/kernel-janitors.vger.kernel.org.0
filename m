Return-Path: <kernel-janitors+bounces-6185-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F1F9AC75C
	for <lists+kernel-janitors@lfdr.de>; Wed, 23 Oct 2024 12:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 368D7B25A54
	for <lists+kernel-janitors@lfdr.de>; Wed, 23 Oct 2024 10:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9C419F116;
	Wed, 23 Oct 2024 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BOkPtVOt"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A3F19E802
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729677986; cv=none; b=emW0JCk/3eC268penTIPKibpUMH5ecmeNOPwUg4BYMq3BvuepfzUNVT7m7xgRQemmu9OjQUtd0wIEG95z/wQQcTZKgnhMd1wWJTieBtpgAuRwRr0KA0WvXCNJi4Q0TuVIoJxPmOeWXOSYKUzTRhK8bhn1Eo3P4gpo/F2vlHOpjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729677986; c=relaxed/simple;
	bh=yU5dZthC4JR7clFEU+VaiuHzsRK9INyahbMu5Agd3mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gr74jpUGacReqIIFKhTQcfj+Gge6MldtNpoG49+CibA2AyC/as7BpfFLnU5I5Z/6QhfBSkFJcDDfunB/K6NZRx4CAYCpFGhk4FN+kcFlIjT8IIbywhy494QQFrWtQpI3yqEVvX2bIHAld9uHrHIbBKxxuhPT+1H4iP/uN8volDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BOkPtVOt; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso5880696e87.1
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729677983; x=1730282783; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QmFWwJacJAgS5CGhagQj/y+QCn9s9Xrg8IyhVVZtACM=;
        b=BOkPtVOt1LxHQ5opf1ucDJvtIJWKr2JsQ8jYpF9UO4nLWGupGgAA+fhuK1023+NX7R
         1ssrUxsyYoxLR9jie7SzjuGKGZ/2h0CS+ktA9JDD46CGz1XbpytaCPTgyt/ikoI6ckij
         9GH61VtPQNglgDMWWSClD/cnATNCRPvZ2YW41y1cyZEvT/8EYAlSCON4MTCgJxuLn1E8
         WZWWyr1c621UzdzQaHtv50ZmujvDRw3THTCH4yD9iJMKfnCjVWeqjQ5zTlWXq9bF/jEu
         VN7KCZJreCh2h82rqn3kfA2SEtG1hEANT1/1Ivm2wsJYwj0CWiRaHVlBZQY1WZOv3GYQ
         4dVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729677983; x=1730282783;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QmFWwJacJAgS5CGhagQj/y+QCn9s9Xrg8IyhVVZtACM=;
        b=o3SNAuPk4YxbvtylYk57QgTCXpf3PVOaA9nE1A37kvhCKjtFeKMcMmBAeupMMnlcRK
         LXBzLKg6IVy4OgL0pA/M7M0UP73MhcJa+Ct9kiEu+BGNicaKygB7ipGyCdfD/xVmBNqW
         1FJPPahCoZRhuOrjwiAUpUJAHg6YpMScMSdfyDLw/zWlT4oWUBQjNH0ZK3SbTcqjAeb7
         53MEGIaKy3JUfjHfqGN5sBhSGSfy0jqJeN19EnfDK0IRa7fSiEbuneVe2RicIpT/ZqmC
         G3T6cOwmMuMZS7Oz5FY2yxxUQV3i4Z2hyFYw3OaC/e8dRhZHkkGamlG9iiixtVwcBxlS
         737g==
X-Forwarded-Encrypted: i=1; AJvYcCXbkYLv9trDVQCqLgnwTS1z4xSd0srfL9WehgzLD9mCj4cji9XeKs9+/tnli49JrIMFM8aRmpADykBKSACZllU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXPXvStag7fzGtBi/KjejkcBU8rDus+DnPRSH54/KuhSg6Z9yo
	tA32Xy/mhXKr0gJLpYrWbyYQ3xRqzIYKRyr0+oDGDyE2ZfA92SnbFBji1IEKvU0=
X-Google-Smtp-Source: AGHT+IENoLqmzudlZrppge6f/QJA6ViYHAbyrrfgtDyUbQMErRS34yaCQr0YHoWGW0qrUIe/m7/udQ==
X-Received: by 2002:a05:6512:1293:b0:536:55a9:4b6c with SMTP id 2adb3069b0e04-53b1a307d85mr1130622e87.13.1729677982662;
        Wed, 23 Oct 2024 03:06:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bd69ebsm11979625e9.1.2024.10.23.03.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 03:06:22 -0700 (PDT)
Date: Wed, 23 Oct 2024 13:06:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH next] wifi: rtw89: unlock on error path in
 rtw89_ops_unassign_vif_chanctx()
Message-ID: <9729c2f5-2df5-4468-a4da-cd31f4332b4c@stanley.mountain>
References: <8683a712-ffc2-466b-8382-0b264719f8ef@stanley.mountain>
 <6a80d4adc51f4ea884b5e02f16d8aaed@realtek.com>
 <931c79c15bc04be99bb87a9826cf2b04@realtek.com>
 <2e85c84b-31bf-484b-b3e2-9285999bb2e4@stanley.mountain>
 <87v7xjma5d.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7xjma5d.fsf@kernel.org>

On Wed, Oct 23, 2024 at 12:38:38PM +0300, Kalle Valo wrote:
> Dan Carpenter <dan.carpenter@linaro.org> writes:
> 
> > On Tue, Oct 22, 2024 at 03:32:23AM +0000, Ping-Ke Shih wrote:
> >
> >> Zong-Zhe Yang <kevin_yang@realtek.com> wrote:
> >> > Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >> > >
> >> > > [...]
> >> > >
> >> > > @@ -1373,6 +1373,7 @@ static void rtw89_ops_unassign_vif_chanctx(struct ieee80211_hw
> >> > > *hw,
> >> > >
> >> > >         rtwvif_link = rtwvif->links[link_conf->link_id];
> >> > >         if (unlikely(!rtwvif_link)) {
> >> > > +               mutex_unlock(&rtwdev->mutex);
> >> > >                 rtw89_err(rtwdev,
> >> > >                           "%s: rtwvif link (link_id %u) is not active\n",
> >> > >                           __func__, link_conf->link_id);
> >> > >
> >> > 
> >> > Acked-by: Zong-Zhe Yang <kevin_yang@realtek.com>
> >> > 
> >> 
> >> Thanks for the ack. 
> >> 
> >> Acked-by is often used by the maintainer, so I will change it to Reviewed-by
> >> during committing. 
> >
> > To me Acked by just means you're okay with the patch.  When I use it, it means I
> > don't feel qualified or interested enough to do a full review.  For example, if
> > I complain about a v1 patch and they fix my issue in v2 then I like to say that
> > I'm okay with it.  In that case I'll use Reviewed-by for a full review or Acked
> > by if the bits that I care about are okay.  I don't like to complain and then
> > just go silent.
> >
> > In the end, it doesn't make any difference.  You'll get CC'd on bug reports to
> > do with the patch and you'll potentially feel bad for not spotting the bug, I
> > guess.
> 
> I have understood that Acked-by should be only used by the corresponding
> maintainers and the documentation seems to say the same:
> 
> https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

"If a person was not directly involved in the preparation or handling of a patch
but wishes to signify and record their approval of it then they can ask to have
an Acked-by: line added to the patch’s changelog."

The documentation does say that it's also often used by maintainers for
approving part of a patchset.  But to me, it's the "partial" which is the more
important word in that sentence.  I haven't reviewed the whole patch.

> 
> The reason I ask non-maintainers avoid using Acked-by is that it messes
> our patchwork listings (it counts both Acked-by and Reviewed-by tags).
> 
> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/

Huh.  I wasn't aware that anything really differentiated between Acks and
Reviews.  That does make things more complicated.

I rarely do Acks, but when I do it's because I'm outside of a subsystem I'm
familiar with.  I would say LGTM and leave it at that, except other people want
proper tags.  Probably they won't insist on proper tags from me though so it's
fine.

regards,
dan carpenter


