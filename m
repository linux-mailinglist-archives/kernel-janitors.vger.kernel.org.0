Return-Path: <kernel-janitors+bounces-1049-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6498244E7
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Jan 2024 16:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94FF11C21E21
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Jan 2024 15:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6370241FC;
	Thu,  4 Jan 2024 15:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ADm76X0G"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C656241E6
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Jan 2024 15:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e7ddd999bso689325e87.1
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Jan 2024 07:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704382002; x=1704986802; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kR6fri6zfOqsumIMPFqXw2iWj6TDkCagFBePFWGJhIk=;
        b=ADm76X0Gi50Nx8wvtv9NF/FY6EdtLnrAE1p/7U/2afCoHYGnMWGZE8R8ihd+p8u7C7
         Xceooq9XehBvgaFuM3R+7+WgJ0qRLda7vTGyPCUE/xPcVCH6sfYxphh1vMURrX0OQEsc
         ltIK8tyXF5TbMGvhBbNE4Yg9nBuIuAmmoGFWmsbU0ZLyeAPl4Q1SASlud2hIOXNv9Bfw
         q1YymnSfnOW2bUo3qiAXBDpMI7rS9lvQEz/F5C4N5TzslrDO8fjkF0Y/8PcHTjHTmHq/
         WEzHmAX+9k9r4+m4JTDB/as40oHBaYdLm2FKtjEk5+irMcJ7IIikdZomFdyeWJZV9QWD
         ZJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704382002; x=1704986802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kR6fri6zfOqsumIMPFqXw2iWj6TDkCagFBePFWGJhIk=;
        b=I9RIgFqsxvdPxEbCnusYLj2YCMEKHlO26OWuyJoLdXPO0vZCMpZZJ/oyrj9jDEQgf7
         MUu68RXlrOIfAqwPCkhVNCF1jof2vPbrKtsYadhQwvhZC5KobwvOD/PYcqfTL1YhfZ8M
         cI3agGR2ujdH8uPg3rHzpiRnzP30ZVNPXSmG/AgnEjCFWc5umAcdl27TCcUy0CPaupOQ
         x7lrzyirNrIP/MBnceM0bqOASRbngsSoQvJadrtRQXaPClEqRiwuPZ7Sw5Vn6Q/fH/ID
         AuyJJQTS30btCJ2kiuwHdqS1xFB3NqF8PbsbK53ocRL+VXYZO/lxoBiFknP9UvMRKQDx
         hZNQ==
X-Gm-Message-State: AOJu0YxB0BSMXuTapJRyZa0oWp58dvqDBhJkXEk8SI/SN9nFBSIVVMut
	XYl4ytbosOxOMEr3KYVyfpXorsHpHVnb0Q==
X-Google-Smtp-Source: AGHT+IENlCSAIUJOeRuY3KAhsacO67sooGmTlUINZ+Exrwrq129QzN3yc1GQd5n4NyrMGN7+x6vRLg==
X-Received: by 2002:a19:ae1a:0:b0:50e:7f5e:59b with SMTP id f26-20020a19ae1a000000b0050e7f5e059bmr380944lfc.60.1704382002669;
        Thu, 04 Jan 2024 07:26:42 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id d33-20020a056402402100b0055422adeb00sm18858482eda.33.2024.01.04.07.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 07:26:42 -0800 (PST)
Date: Thu, 4 Jan 2024 18:26:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Subject: Re: [PATCH 1/3] drm: property: One function call less in
 drm_property_create() after error detection
Message-ID: <b56e4902-f020-4461-abf1-563e6f8b23e6@moroto.mountain>
References: <ff7ce5d0-59fa-470c-8dd6-68dbe65c18e5@web.de>
 <9b1e7330-f4f6-47f8-a568-eaea1624bb6f@web.de>
 <37647c33-7f9d-4763-8bf4-cfc5c9a811de@mailbox.org>
 <c5f1a7bf-b444-4934-a205-3c2b3a045ff7@web.de>
 <dd300771-851f-4cfb-b9a2-d87d2b4399aa@mailbox.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd300771-851f-4cfb-b9a2-d87d2b4399aa@mailbox.org>

On Wed, Jan 03, 2024 at 06:18:13PM +0100, Michel D�nzer wrote:
> On 2024-01-03 17:24, Markus Elfring wrote:
> > 
> >> Out of curiosity, what exactly did Coccinelle report?
> > 
> > Some SmPL scripts from my own selection tend to point questionable implementation details out.
> 
> That doesn't answer my question.
> 
> Without seeing the actual Coccinelle report, I'll assume that it didn't actually call for this change.

This isn't one of the Coccinelle scripts which ship with the kernel,
it's something that Markus wrote himself.

regards,
dan carpenter


