Return-Path: <kernel-janitors+bounces-986-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 536368214E9
	for <lists+kernel-janitors@lfdr.de>; Mon,  1 Jan 2024 19:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A56F0B2114B
	for <lists+kernel-janitors@lfdr.de>; Mon,  1 Jan 2024 18:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35326C2C5;
	Mon,  1 Jan 2024 18:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="Les3QTOH"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73F9BA3B
	for <kernel-janitors@vger.kernel.org>; Mon,  1 Jan 2024 18:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6d9af1f52bcso1901079b3a.3
        for <kernel-janitors@vger.kernel.org>; Mon, 01 Jan 2024 10:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1704132744; x=1704737544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yfcinmzu3fGAHYO60etHbYExmH51CIjL4/eAucUWHkA=;
        b=Les3QTOHWak7mFcH9qiRuvPciyV+VyctLxpjyx9kGtuM+8bLbvLlkC0GivJdgBZ9Lw
         p8nESOO4PTQYdNTmoXrSvxKr2xW+SCEByqzS6l3XzdD9oPZ6NXubwMGfGImwfXj3zF/v
         MmMt8Z3Em6YmZ25EW67Cjg5cDs+1LUPNRaEc+jplMfG2SKJ/RLWBTlEEtKTYjFeqlebG
         9KCXrQx7M6lGhB3bnqVtl5IWpsibU/7HhhwDt5u1AsdGEMKpLcG9x56XSWC5PyHgiBVJ
         GWInuQsa9tpXTifrlkqsqvnwTR0ALXJUwV79WD1QTCiKiMg/05vTn1K2KdSauOwH1eAl
         5WFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704132744; x=1704737544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yfcinmzu3fGAHYO60etHbYExmH51CIjL4/eAucUWHkA=;
        b=JC2/sJ2y8+OsDEoCnSzy4WVOua9x/TvSQbGtZ33O0MN+k1sm7cIP+GKsqtOEMVr2cZ
         qv1VcHXBWtNMieRib4Zg6e7LFWpBzNBFXDsoeqqxAI69lIGpwBwZGVabWGBndLzl9t2J
         enKBgNfLC8eyXqKvXihSWxz3auR+DE3VGlUaKGixJ03iSm4RDkxeHp7wBm966P3jffpp
         r4+9ToqEmWhO4wLGcU9aR0uGGXprwDvHCaOgS549zcHjRE6TvOhJLcbhfV8Avh98v5Xb
         wcrVhAJP9aW+8/92SUNFsR1/8qVREDx1x81Sk90Dm82XEBWnuQ/lw1aOVcDfN6vHuXKb
         X1Sw==
X-Gm-Message-State: AOJu0YwUaj93XrIcFTRBRNXsSCutzSMuCLpyf6PWv3zj+Td74jWIaruB
	2SUr0a8e+yD2ypxoyv+MXrhb+MZJhR9nHg==
X-Google-Smtp-Source: AGHT+IHWr79IDfGUgn0Of4gsM+Z/TLPclGPF4NChQ8ZT1YIYFxNFQk6DXwGn7K/+2nGo///akLy5zw==
X-Received: by 2002:a05:6a20:9185:b0:197:2f2d:acf1 with SMTP id v5-20020a056a20918500b001972f2dacf1mr158354pzd.10.1704132744068;
        Mon, 01 Jan 2024 10:12:24 -0800 (PST)
Received: from hermes.local (204-195-123-141.wavecable.com. [204.195.123.141])
        by smtp.gmail.com with ESMTPSA id n7-20020a170902e54700b001d0cd351baesm20338723plf.13.2024.01.01.10.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 10:12:23 -0800 (PST)
Date: Mon, 1 Jan 2024 10:12:21 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: packet: Improve exception handling in fanout_add()
Message-ID: <20240101101221.73276d5d@hermes.local>
In-Reply-To: <a69fce11-68c2-446c-9da8-b959bb3ba70f@web.de>
References: <828bb442-29d0-4bb8-b90d-f200bdd4faf6@web.de>
	<6591e0fcb089f_21410c2946c@willemb.c.googlers.com.notmuch>
	<a69fce11-68c2-446c-9da8-b959bb3ba70f@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Jan 2024 10:46:45 +0100
Markus Elfring <Markus.Elfring@web.de> wrote:

> > It is fine to call kfree with a possible NULL pointer: =20
> =E2=80=A6
> > 	 * If @object is NULL, no operation is performed.
> > 	 */
> > 	void kfree(const void *object) =20
>=20
> Such a function call triggers an input parameter validation
> with a corresponding immediate return, doesn't it?
> Do you find such data processing really helpful for the desired error/exc=
eption handling?

If you look at the existing coccinelle script there is even one
to remove unnecessary checks for null before calling kfree.

