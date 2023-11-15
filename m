Return-Path: <kernel-janitors+bounces-249-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6317E9984
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 10:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 656AD1F20EE4
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 09:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FEB1B275;
	Mon, 13 Nov 2023 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ED618B08
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 09:56:01 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EACE10F0;
	Mon, 13 Nov 2023 01:56:00 -0800 (PST)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6bf03b98b9bso3820562b3a.1;
        Mon, 13 Nov 2023 01:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699869360; x=1700474160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nsc8vtXkUo5t3WVD7oZaxgFt8EkLh3VFaj+jDioq7Og=;
        b=fXS/Kqm/ryvjtYOYimE0ExuI3rfYftqidhBDGpjZDkfJOyMYxEGt/twy5gNYehD4Bg
         RP5EOUAePvmWeWlfPhC5qSejWOUM3AiHIRgplzZN1k48uXsAoPa6WF5B7jnALZE3l874
         AQEkWCmSAKdjd3DkTXUDIiGKHc5KkSGd4WZxIc1Wd1mMFDUw260LGHYkkMF7IuPeYl6K
         bJmIPN7+5XHxj2T83iBcp32ItWy65QPbIK0FewLeszLyyYNaqhO/1Mx5PAfrlBiwDJwi
         WrXj3ZhoQ3j/P+5LviJ4DhZv7J1RkL6ccsOARDTSBP/TWLHKw7+NsJU5hCtn0GFjbsx2
         d8Eg==
X-Gm-Message-State: AOJu0YzotAsYwKpEiw7YMUrWCDUsib4CyDueZav6G1BKUCZ0pY+Fcd69
	i/CvmsGTvAnE4cK9h20ufMc=
X-Google-Smtp-Source: AGHT+IFDhzdbozjxULojFhxvaungObdZ8MGXETq2opLG6Qt0hs5cmrxuZIDoBfJGwk5O9aGkhbp3gw==
X-Received: by 2002:a05:6a20:12c9:b0:17a:e981:817e with SMTP id v9-20020a056a2012c900b0017ae981817emr9039810pzg.3.1699869359937;
        Mon, 13 Nov 2023 01:55:59 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id t17-20020a62d151000000b006934e7ceb79sm3744791pfl.32.2023.11.13.01.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 01:55:59 -0800 (PST)
Date: Mon, 13 Nov 2023 18:55:57 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI: kirin: Use devm_kasprintf()
Message-ID: <20231113095557.GA1583963@rocinante>
References: <085fc5ac70fc8d73d5da197967e76d18f2ab5208.1699774592.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <085fc5ac70fc8d73d5da197967e76d18f2ab5208.1699774592.git.christophe.jaillet@wanadoo.fr>

Hello!

[...]
> @@ -387,9 +386,8 @@ static int kirin_pcie_get_gpio_enable(struct kirin_pcie *pcie,
>  		if (pcie->gpio_id_clkreq[i] < 0)
>  			return pcie->gpio_id_clkreq[i];
>  
> -		sprintf(name, "pcie_clkreq_%d", i);
> -		pcie->clkreq_names[i] = devm_kstrdup_const(dev, name,
> -							    GFP_KERNEL);
> +		pcie->clkreq_names[i] = devm_kasprintf(dev, GFP_KERNEL,
> +						       "pcie_clkreq_%d", i);

I think, the kirin_pcie_parse_port(), which is just below form this
function, might benefit from the same type of a nice change.  Thoughts?

	Krzysztof

