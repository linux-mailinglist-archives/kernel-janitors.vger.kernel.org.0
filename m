Return-Path: <kernel-janitors+bounces-2447-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C100289BF70
	for <lists+kernel-janitors@lfdr.de>; Mon,  8 Apr 2024 14:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2F7B1C2125D
	for <lists+kernel-janitors@lfdr.de>; Mon,  8 Apr 2024 12:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C727BAE4;
	Mon,  8 Apr 2024 12:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OkMuKgvF"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2326768FC
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Apr 2024 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712580635; cv=none; b=PFYB8cDPanh3JF2AOd+b4+fC/DT2kbiTKaIk/c0w5+xtQGLc0palidkbt6VyoY684Anz6orM5N1PmDHXb8cwsmZeMvjX/F4A6absPq/Dnihd84NHRlq3qo+4Es2Miz9lGfYqi8NKHs2ggdBcoB0QNCYoURH5n/uIpA8qqFLNga4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712580635; c=relaxed/simple;
	bh=+b1X+G4j5vg/g5sSVMIsG4l7qLj4/UnWr/Wp6hgV9mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVdLwrF2010nf/lqdEz/4hzfErvK5PS+NIWCHjzcc2FXd2Gr5CLM7kbvfX6pqebykhnTyJ/xgUiXHKbix9jqIwbOsHYxEgd3heEbh2S0fDaRTAoOcVIRj9hu04vke8lzyTBMgjqF0wCWCwPS0+du5kHaCrbEtX5GB0of4GNj9UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OkMuKgvF; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a51c37a5025so203007166b.1
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Apr 2024 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712580632; x=1713185432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Jqz2JncY/jtoTAT+GuKbSQdZrYRr+WWEpeeXtkbxJY=;
        b=OkMuKgvFnYVc+IB28JRvs5iXdL6ltKA9RIhr//7rqw4TygeqhuSlJ/CF7XsuXKMDOX
         FQaBdD/brMmhNGAKwymcm2pX+/kkV3KgQywea6uwGfK18G2+v+5zAZh0ChoFboikn2KF
         PjfUYA8b6jK08fzbjWDJ2OEq2d5/PYhUn1NKiNLYiR5f0p1lR3m5HF4vL1mM/xc/B5ck
         bP36qyCtZFCxjTAG66kunpKv6HzRYxge7csIQf5QWEhSZpXSv/rpf6RJY5hsZQ7S4G9y
         b8IjoNMP6l0aFB2XPeoD/2ShTyTAgw21veNMCCSRttd6tr9BApDSPNZtoRMyf27jebK5
         QqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712580632; x=1713185432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Jqz2JncY/jtoTAT+GuKbSQdZrYRr+WWEpeeXtkbxJY=;
        b=FiCEX2rhg7lr7dchoEp3G7jJW4vQ21mUdaoBAKwhdtt/PX+hdUbKmkhRL6HicdrFs4
         /90KT/KNfX0AmVJvDP3IY97qcUe3i28FsTQxP/F9iArsxbs6DKdXk2X/b4mevVRI5AbP
         CfP/7gYIeEuwIl/1X5m1tQwf/o65NVDYC0iTAiTvNstH+B9g7RK80mITEWRjU3E6m43r
         7khbQ/WHBokYjqgheoN0Ea9me4Qi9AzWFdEzU9tJzNLforM7XHZ/OOkuKrMLXC7EjB8b
         XQbTbYW6mNuKBPwqhAPWciY1HpmJexlGrKnG4KRvNSX8QP70PYZn1GlVypQAgXRJgeIs
         9+cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgqQt7P7oG7Bbquz/JET1xBGcLT7QkjC+14qCikPqNlNo8kzOiYtYuhdNo3yaw5CoubdJO05VM+9grnmHsq1nH6cJE9DonTSFYWvYiRvMW
X-Gm-Message-State: AOJu0Yw5Vh5HiTP75mUaqfLFmwFRVFJy8fablIzwQM/V6nkg/lerIsVz
	qcU9FPE53euQ70PiwsXicoWZxkErLF7gLvbFM7GruLJ1z6jZLaE+A7ujvM/Dn2o=
X-Google-Smtp-Source: AGHT+IGkACAAt6WrK3fdfk6qOQT1T9IleXUaTnuLuR3BsyNyAKeaVDfXwn5PTPwMGxSdOVxQ6RZO0w==
X-Received: by 2002:a17:906:f58d:b0:a51:9f5b:b659 with SMTP id cm13-20020a170906f58d00b00a519f5bb659mr7056707ejd.34.1712580631945;
        Mon, 08 Apr 2024 05:50:31 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id c22-20020a170906529600b00a51bbee7e55sm3058843ejm.53.2024.04.08.05.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 05:50:31 -0700 (PDT)
Date: Mon, 8 Apr 2024 15:50:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-card: Fix a reversed if condition
Message-ID: <b692071f-0c43-48eb-8faf-f9279c3d9439@moroto.mountain>
References: <155bb76e-dc57-4a5c-b0eb-acee5ebde9f4@moroto.mountain>
 <25771b56-8564-42c1-9a2d-408d91f23618@sirena.org.uk>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25771b56-8564-42c1-9a2d-408d91f23618@sirena.org.uk>

On Mon, Apr 08, 2024 at 01:43:09PM +0100, Mark Brown wrote:
> On Mon, Apr 08, 2024 at 10:38:02AM +0300, Dan Carpenter wrote:
> 
> >  	ret = snd_soc_register_card(priv->card);
> > -	if (!ret)
> > +	if (ret)
> >  		return ret;
> >  
> >  	return 0;
> 
> Clearly a better fix here would just be to remove the conditional
> entirely.

Hm...  Actually, it should be:

	if (ret) {
		put_device(priv->card_dev);
		return ret;
	}

	return 0;

Let me resend with that instead.

regards,
dan carpenter

