Return-Path: <kernel-janitors+bounces-5124-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EBB95D8EF
	for <lists+kernel-janitors@lfdr.de>; Sat, 24 Aug 2024 00:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 497181C2233C
	for <lists+kernel-janitors@lfdr.de>; Fri, 23 Aug 2024 22:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D42195;
	Fri, 23 Aug 2024 22:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lup3u9e3"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEEA1922F8
	for <kernel-janitors@vger.kernel.org>; Fri, 23 Aug 2024 22:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724450495; cv=none; b=LlZuXCcHExEDWvsVwUBZTsQxzyY3tFFwc9hC7m9qjW1Dgz+ECGuZ6eZzPgancbrj26fvsNYRG3xghzZKEiDf/hkzBrS9JXVRGv/OO3ENFV0Zh6P0LZgviPHQWbfMseyw8MDDQeaIaU2I0no0hKtut3u5Lgs0bpLkmJHGJ0i4444=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724450495; c=relaxed/simple;
	bh=VvJKpJJfmD7iLRFCJk1VXjjaQa41DmLkUJVxiqmPuus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2ngFDMVeQSTfvt5IFdHvr8oA/RTJGbfZEDV7fIh4aZbwJWsrFUiY+Xiz2JMuMqs8QPHtzH2DQipLgPKfz7GO4XTjmUDbnALwnOwc8f9cynE5JlZ+SL3mgIImX6vEb3CJuPiAiYD+PW+V8RHS8+grBSY4FLcMGxiAi9lKrBPu8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lup3u9e3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso19229525e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Aug 2024 15:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724450492; x=1725055292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lFadsMRdLC68efTKJRnWoj9CJBJeNBa9X0F1mBmwwOE=;
        b=Lup3u9e3B+cuOhuCeLCJ92DbMc871BpUA8BDRsPo/pnmsurw4Zdcjh22cHE0B4clOl
         1L4NYqfD6wHWBCmjJkMlqwIXZ+uLdZy0yxJVxDqoj8oIsVeYe52c3S3a9jOLcOQOJjj4
         9CN6xdyzYMMUfxNVvaiwEyqLhwiwOIrIkzZ/6UHbsAvCTIp2k60mMKBwa3J0q+vXUI7d
         ro8xvlo5RsyebjVuc2esbTUVyQYfsFZoKuQr1CLaKpPD7vO0BNecw/XZD0eVPGJiqj/A
         SHdZ8YkfuG0tGk/NpxbSbAaPC62FNdQFshym90ftSsYHy7XxZ0KfQsJiI9usGftUrGa+
         Za9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724450492; x=1725055292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFadsMRdLC68efTKJRnWoj9CJBJeNBa9X0F1mBmwwOE=;
        b=PBI7y1MPb9lXvmbKH9omEQbs3MM8LIIySFVmEcZ1pTichtdQuXhhIETfkzi7IBIfL7
         aOrZHKIGaEOZRcGEqj7lIOXGYbZReEanuNMbw6LiRSUXLR8vAxIc96pmX2udTzwdzL5c
         cQA1pF3o+JX1Nm2YZ3+Rpv+nZ55VdjHdJQmcQbt/U68h0IS7W1lEGqEo7ULgQb4yQAMx
         ucUlsyRTGf28cH2Bj1At5HoH3V6807Vi9m/Ss3uEBjsLZ2QFeh9gBinjGwDIHlBLeJyi
         986k6Y4KDJmGTPPlxPk4lmHio722hzXhx710i5L1se1k2T5CdXLRZay0j21LfqssVuZB
         3aFg==
X-Forwarded-Encrypted: i=1; AJvYcCVfCTRvYjyWxyCSmVAkIqTnAVpufvl52SW9orQGLdzR+7WGwbERxwD1r6sWzYOPoOiyw528HwjTn2pqz3pLGiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuj4Cs9c/tFlykQQykdRzQOigAbGYgHxuov1VvIEytHR5lWx8d
	0pDwFWH0tUn/DzuxEjTOrfqsdKRszZcXGohyRz4fbZXCZOIhF/M1xjHLfFQCXsk=
X-Google-Smtp-Source: AGHT+IGGy3Wdnvs0hhS/uAOkCfiTUkdDsGvNJsG42+IyR5Xa1O/wChhS3aoA3RbjU4k7MpOb56ez1Q==
X-Received: by 2002:a05:600c:4453:b0:426:4978:65f0 with SMTP id 5b1f17b1804b1-42acc8dd846mr27740605e9.18.1724450492090;
        Fri, 23 Aug 2024 15:01:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac517a68dsm74182985e9.33.2024.08.23.15.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 15:01:31 -0700 (PDT)
Date: Sat, 24 Aug 2024 01:01:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Charles Wang <charles.goodix@gmail.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] HID: hid-goodix: Fix a signedness bug in
 goodix_hid_get_raw_report()
Message-ID: <8d51a7cc-5e7a-4503-b236-720aca44e305@stanley.mountain>
References: <8e6fe9f1-fcd8-4264-b28d-a1ee99b592b8@stanley.mountain>
 <ZsjsydZtMu3RyM0P@google.com>
 <5660b5ea-0806-493e-8364-15b0d519be76@stanley.mountain>
 <ZskF9ROgsO-mfIJ2@google.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZskF9ROgsO-mfIJ2@google.com>

On Fri, Aug 23, 2024 at 02:58:13PM -0700, Dmitry Torokhov wrote:
> On Sat, Aug 24, 2024 at 12:32:53AM +0300, Dan Carpenter wrote:
> > 
> > I can also resend.  I don't mind doing that.  I've already written the patch
> > that you're describing and I just have to write the commit message and hit send.
> > I can send it on Monday.  Whatever is easiest.
> 
> Yes, please send it unless you hear from Jiri/Benjamin that they like
> current version more.

Sure.  Will do.

regards,
dan carpenter


