Return-Path: <kernel-janitors+bounces-3143-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B72A8C600E
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 May 2024 07:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CFEC1C20C5D
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 May 2024 05:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EBD39FE9;
	Wed, 15 May 2024 05:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ej67GMLX"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37966381DF
	for <kernel-janitors@vger.kernel.org>; Wed, 15 May 2024 05:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715749785; cv=none; b=AdosNEIyijcfG5RaP7VyOMiKHNQzS7ya72IZX/UCEnfQ7MvfxbMFhMT8MdFKQrG6MaQW3KX75TQhy9rycjo9HewNSEzDfSzB6sG7/yyFcIOBwvpv1PgTwcb/0XGNWRN1EtNMFFwgat4kmz9nE5SGgYNRCiG0w675OWkwBMD4nMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715749785; c=relaxed/simple;
	bh=PWr1eoNqTJuHMfIrKTjK0JxHOEZr8PegEGVOLzYxh8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lakk2G3ZgE7LsklLxLv7ktaZpJxQQiGevPQaTiirxycSo5QKtqOHPEC9rz5S6ASbg4YsQeLZOfg2UEDI+HKGQyUgtEW4HrHAYWs4hS+788pWF8inQPlc4co6oS4Y1tLfrc7KlEDWY7asfLseQarS+0SuMW0iz8flKOm0XCye6MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ej67GMLX; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e09138a2b1so91086511fa.3
        for <kernel-janitors@vger.kernel.org>; Tue, 14 May 2024 22:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715749781; x=1716354581; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=975B1sVy32LTXzxsALukKLfSACwxUEyol/q8JnyOA4o=;
        b=ej67GMLXY8Y51jLGong7n/KBK7cX/nzd0k4PgoxEeCn69smoXi1dDjTuytEIov8rmm
         AmGUE9ZAqmO87ghfuvA7MHRjLiM9DoNE15HRFapLVka3yaA/EPyQcbwn3neYNB8n838l
         hCu3Al+LNdIDI0G8t7a6OYoe+Nv4DgPwvcDH2lyzA5rEGksUMjVnpwJiaLUDTY6CYCsu
         oGKUVO32NnaisJfn7T2B9Dnt5hityYs6KL8j0QvqLXDLwGHmfBpKg+L8cHJ8OSU44Ogt
         ATLtESK7UB9fCiBZS5bii8h+gEIuPyvhRIOUwJ1mr830E4VcFV4temwpJ3a0ywQoh2SM
         f+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715749781; x=1716354581;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=975B1sVy32LTXzxsALukKLfSACwxUEyol/q8JnyOA4o=;
        b=CXkcyfGpGbCHD2dOt13JBNhIIYE9LFCi+jrUpwWDSuR4cgqOK6N2s97KJQ4mqfu/UX
         1pDFK2uYr9hKf11IV3VBCA/IIVYCewHo0BoDfXDmM0kDVrcgNDwqB7Ii7PMY+JbyeQ32
         c9gW8SfP9/OHVH7qMJ97qmmvU5zU5B9rHmLzIVQ9PJhTvvzLkBWcTIIgaKXI3PBnPdkT
         TrW0EIYR0GDUlJy3wmIyRHTABlw6I1bQw2v3sSPmaqYLLLBFwA7CwuJfTtX4Yh0o/kev
         +ZDxgc1pwAgDGj+5IeY90oxGT2wrTAbP6y/IXbPruUZ7NoaJWCPU4XYUYhhJ+EMz8Q0i
         dI3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6wdPKELE1h96QiKnwK6JTwcfDnAwrtxodxPbpqXkZNeJdYLTfl8+ArLq5xTj2LOL/oOVgIPC164vs3pBrsmjWrv3aPo86NpGChS3LcMec
X-Gm-Message-State: AOJu0YxrFR4QeM4S2+Knhs9nkyb70PoAfNcv1vrsZWhEDrxJRMl81Cca
	uxswUU26TiDYzQ0OjmMg7PwczJbm+XMfYL29LwQ5k6khXK0XZXYDdEQi9q3HMkM=
X-Google-Smtp-Source: AGHT+IGrUkRE45seMgtIIoE9PEoi8QF/KuINpSVm4YfmrAzeH/MZdLnoXwgGuJCSWjOgBpc2tUxYKw==
X-Received: by 2002:a2e:84c9:0:b0:2d9:eb66:6d39 with SMTP id 38308e7fff4ca-2e51ff667d5mr92842571fa.19.1715749781375;
        Tue, 14 May 2024 22:09:41 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6340a632608sm9175077a12.5.2024.05.14.22.09.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2024 22:09:40 -0700 (PDT)
Date: Wed, 15 May 2024 13:09:32 +0800
From: joeyli <jlee@suse.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Chun-Yi Lee <joeyli.kernel@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>,
	Kirill Korotaev <dev@openvz.org>, Nicolai Stange <nstange@suse.com>,
	Pavel Emelianov <xemul@openvz.org>
Subject: Re: [PATCH v2] aoe: fix the potential use-after-free problem in more
 places
Message-ID: <20240515050932.GG4433@linux-l9pv.suse>
References: <20240514151854.13066-1-jlee@suse.com>
 <e8331545-d261-44af-b500-93b90d77d8b7@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8331545-d261-44af-b500-93b90d77d8b7@web.de>
User-Agent: Mutt/1.11.4 (2019-03-13)

Hi Markus,

On Tue, May 14, 2024 at 05:34:57PM +0200, Markus Elfring wrote:
> I suggest to reconsider the version identification in this patch subject
> once more.
> 
> 
> …
> > This patch makes the above functions do …
> 
> Do you stumble still on wording challenges for improved change descriptions
> in your patches?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.9#n94
> 
> …
> > ---
> >
> > v2:
> > - Improve patch description
> 
> V3:
> ???
> 
> V4:
> ???
> 
> Would you like to include issue reporters in message recipient lists?
> 
> Regards,
> Markus

I will wait more suggestion for code side and send new version.

Thanks a lot!
Joey Lee 

