Return-Path: <kernel-janitors+bounces-8004-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E5CAAF8C6
	for <lists+kernel-janitors@lfdr.de>; Thu,  8 May 2025 13:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CCFA9C8060
	for <lists+kernel-janitors@lfdr.de>; Thu,  8 May 2025 11:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254AC221FD6;
	Thu,  8 May 2025 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FyI5oZEd"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBDC2153E2
	for <kernel-janitors@vger.kernel.org>; Thu,  8 May 2025 11:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704102; cv=none; b=g0y4w4RkbcotRmphJ+cNKzu9VY0gkV3JnIn0vvidQbWrCbwt3JN06sbuHw6tflIes/1vwlWQ1FrT+23UGLbPlm9h+nshCONFJ0/QdNI29XKaK7TLOsEhfn++NbQ41EcKMhB3MPYDZDtHVncaZaybGjYag2aX4IHBeJ8+yCbnoMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704102; c=relaxed/simple;
	bh=oA1OiCMhmphQt5LlavV/Bcw1WuniQxuqjCoszOxphYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wyf0jLSOjwyH+5A52M6Dhae/wcRD7AguQyKKsV9Ev5FuIctBIkz7hWrV0XaDTl35uxEHg+7VUtIjoLIY3nPCauMijAOVXN8k0I0csbSt1/k9E0ZENTDLJpA5BNNeI7ni2YUuZPrbaEZPHjnKidJCEzeyUDIbxlavZKql1DTvV54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FyI5oZEd; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso888187276.0
        for <kernel-janitors@vger.kernel.org>; Thu, 08 May 2025 04:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746704098; x=1747308898; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4I3mCeE7NaxK25rclKHFgvE1pFxuXrcbii3YouC46fI=;
        b=FyI5oZEd7slpVzco9ViJfsAwtoZyQuAb2R492GKoVL5KJpNMVeGItCL7b5iLXpt6Mf
         a2MHelWty3udeXcJ4GI3pkPvze1KuJfT64lhDdS3cUtRIK3KxGXpmxnXVAs6MUTUy79+
         lv4AnGUpSm443rYSGV/83Uh4WY1TEpuegDuIcc4xVe+OA5jFCR+umiDDn5i6I8bxdxKe
         QmseUZZMBBTtpfZ0dZVbFxndELZBUPZoskYG8exqTTG1ccRh+XAy08xODInS3mGQOnem
         DMN+0yEhCxrCNilFMJ4sCIDU/GNf4itwRt/nAYVDqdywSapnumpspbakco3lZZ91Wv8q
         +Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704098; x=1747308898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4I3mCeE7NaxK25rclKHFgvE1pFxuXrcbii3YouC46fI=;
        b=CbKeN8gmsnipoNad8/dM0/77Y4+U814wBlzH0kbI4KUDhmWAggD/DnpquVq6I+nrGw
         ball2Vw8ebfXKnrJemNhMRp5Oklrh14cksQX1i4VdetWfrPNC6FXU6wfwx/htxK4sBff
         3XWO6wEhrMr4uOUs6UmObcoSUBKcmqQGWdYXWs8B1iIRuCKhkULgsLNDPNjat3tdl5ZW
         8oOv2n3bu6GDxFNyEcWuW8QUUOC+g990wfPJofJL9LBlTILL4sPOWHVCrP4XfUKIOMm/
         wOvxCNvbJIvCSppG4idJJwqeCIUJ28Tb9GujLcvS28yVuBoE0IXy5tLy24rHahmb4wWY
         B+/A==
X-Forwarded-Encrypted: i=1; AJvYcCV3hBjD3Mto2Adfvdhpgcq1Qof+hXYPLdTkARB/WcxLf7osF0ZO+feuUG7wWHVrf/u92/Q3XQZEs9n/rgeBBu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdiIt7F0d1QT7MXK+71FYKfx9RH39IhBm3wD4v4JI/U2l+bEVb
	tJzxAMTOmcXgfvf/7Fsn1f9ev2ziXevDezy0qQqR+EDYwI5u6OPJK5rW+5WSjXBFEAbiwYSkY51
	lTDAuIfe+gCWFivaz6dmQmEuT0cd9dfzqHoyXSg==
X-Gm-Gg: ASbGncs6s0NcFcz+5uIDYI63gT5OnhbFmonGN+heffKTYbQ4m1DUSJ1ztH1ZnlIZDKl
	Q3H2LCYsMuxd/jxyeYIsP9ZtvdvtKkjL2apm+Nuw7wzyRTFPXIPLeNSTslQTotIjcTm4hiG6dGd
	rKaCZZbu77D5aBBWY7dNox4rvmLCQlBaPnIg==
X-Google-Smtp-Source: AGHT+IFISwEmEaUPEIGkAw+pjWlFVBT86sEjNE/qTVOISvnuF8D1u+N13cESKrEtVLIEhG9cDQKZ22WKp9cDBmU869o=
X-Received: by 2002:a05:6902:230f:b0:e73:1ff1:ca2f with SMTP id
 3f1490d57ef6-e78ef6f7c55mr3350492276.32.1746704097920; Thu, 08 May 2025
 04:34:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <edc560afe2a8763c93341d161daeb8b33ba606c6.1746199917.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <edc560afe2a8763c93341d161daeb8b33ba606c6.1746199917.git.christophe.jaillet@wanadoo.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 8 May 2025 13:34:22 +0200
X-Gm-Features: ATxdqUFTyHds9ofNJKemjngwN8NRV53Nc2rYed1UjoRSW5B2VKN5wXgtKbJ3AXY
Message-ID: <CAPDyKFpQPj8ky-QkOTgb0KQFoj+cP0EPE-uFu_MQozPC2vosOQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: Constify some structures
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 May 2025 at 17:32, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Most structures in this driver are not modified.
>
> Constifying these structures moves some data to a read-only section, so
> increase overall security, especially when the structure holds some
> function pointers. (This is the case for see meson_ee_pwrc_domain_desc)
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text    data     bss     dec     hex filename
>    8924    3832       0   12756    31d4 drivers/pmdomain/amlogic/meson-ee-pwrc.o
>
> After:
> =====
>    text    data     bss     dec     hex filename
>   12396     336       0   12732    31bc drivers/pmdomain/amlogic/meson-ee-pwrc.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe

> ---
> Compile tested-only.
> ---
>  drivers/pmdomain/amlogic/meson-ee-pwrc.c | 78 ++++++++++++------------
>  1 file changed, 39 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> index fbb2b4103930..55c8c9f66a1b 100644
> --- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> @@ -69,27 +69,27 @@ struct meson_ee_pwrc_domain_desc {
>         char *name;
>         unsigned int reset_names_count;
>         unsigned int clk_names_count;
> -       struct meson_ee_pwrc_top_domain *top_pd;
> +       const struct meson_ee_pwrc_top_domain *top_pd;
>         unsigned int mem_pd_count;
> -       struct meson_ee_pwrc_mem_domain *mem_pd;
> +       const struct meson_ee_pwrc_mem_domain *mem_pd;
>         bool (*is_powered_off)(struct meson_ee_pwrc_domain *pwrc_domain);
>  };
>
>  struct meson_ee_pwrc_domain_data {
>         unsigned int count;
> -       struct meson_ee_pwrc_domain_desc *domains;
> +       const struct meson_ee_pwrc_domain_desc *domains;
>  };
>
>  /* TOP Power Domains */
>
> -static struct meson_ee_pwrc_top_domain gx_pwrc_vpu = {
> +static const struct meson_ee_pwrc_top_domain gx_pwrc_vpu = {
>         .sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
>         .sleep_mask = BIT(8),
>         .iso_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
>         .iso_mask = BIT(9),
>  };
>
> -static struct meson_ee_pwrc_top_domain meson8_pwrc_vpu = {
> +static const struct meson_ee_pwrc_top_domain meson8_pwrc_vpu = {
>         .sleep_reg = MESON8_AO_RTI_GEN_PWR_SLEEP0,
>         .sleep_mask = BIT(8),
>         .iso_reg = MESON8_AO_RTI_GEN_PWR_SLEEP0,
> @@ -104,20 +104,20 @@ static struct meson_ee_pwrc_top_domain meson8_pwrc_vpu = {
>                 .iso_mask = BIT(__bit),                         \
>         }
>
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_vpu = SM1_EE_PD(8);
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_nna = SM1_EE_PD(16);
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_usb = SM1_EE_PD(17);
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_pci = SM1_EE_PD(18);
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_ge2d = SM1_EE_PD(19);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_vpu = SM1_EE_PD(8);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_nna = SM1_EE_PD(16);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_usb = SM1_EE_PD(17);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_pci = SM1_EE_PD(18);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_ge2d = SM1_EE_PD(19);
>
> -static struct meson_ee_pwrc_top_domain g12a_pwrc_nna = {
> +static const struct meson_ee_pwrc_top_domain g12a_pwrc_nna = {
>         .sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
>         .sleep_mask = BIT(16) | BIT(17),
>         .iso_reg = GX_AO_RTI_GEN_PWR_ISO0,
>         .iso_mask = BIT(16) | BIT(17),
>  };
>
> -static struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
> +static const struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
>         .sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
>         .sleep_mask = BIT(18) | BIT(19),
>         .iso_reg = GX_AO_RTI_GEN_PWR_ISO0,
> @@ -154,39 +154,39 @@ static struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
>         { __reg, BIT(14) },                                     \
>         { __reg, BIT(15) }
>
> -static struct meson_ee_pwrc_mem_domain axg_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain axg_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG2),
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain gxbb_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain gxbb_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain meson_pwrc_mem_eth[] = {
> +static const struct meson_ee_pwrc_mem_domain meson_pwrc_mem_eth[] = {
>         { HHI_MEM_PD_REG0, GENMASK(3, 2) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain meson8_pwrc_audio_dsp_mem[] = {
> +static const struct meson_ee_pwrc_mem_domain meson8_pwrc_audio_dsp_mem[] = {
>         { HHI_MEM_PD_REG0, GENMASK(1, 0) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain meson8_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain meson8_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG2),
> @@ -198,28 +198,28 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_vpu[] = {
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_nna[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_nna[] = {
>         { HHI_NANOQ_MEM_PD_REG0, 0xff },
>         { HHI_NANOQ_MEM_PD_REG1, 0xff },
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_usb[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_usb[] = {
>         { HHI_MEM_PD_REG0, GENMASK(31, 30) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_pcie[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_pcie[] = {
>         { HHI_MEM_PD_REG0, GENMASK(29, 26) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_ge2d[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_ge2d[] = {
>         { HHI_MEM_PD_REG0, GENMASK(25, 18) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain axg_pwrc_mem_audio[] = {
> +static const struct meson_ee_pwrc_mem_domain axg_pwrc_mem_audio[] = {
>         { HHI_MEM_PD_REG0, GENMASK(5, 4) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
>         { HHI_MEM_PD_REG0, GENMASK(5, 4) },
>         { HHI_AUDIO_MEM_PD_REG0, GENMASK(1, 0) },
>         { HHI_AUDIO_MEM_PD_REG0, GENMASK(3, 2) },
> @@ -235,12 +235,12 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
>         { HHI_AUDIO_MEM_PD_REG0, GENMASK(27, 26) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
> +static const struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
>         { G12A_HHI_NANOQ_MEM_PD_REG0, GENMASK(31, 0) },
>         { G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(31, 0) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
> +static const struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
>         { G12A_HHI_ISP_MEM_PD_REG0, GENMASK(31, 0) },
>         { G12A_HHI_ISP_MEM_PD_REG1, GENMASK(31, 0) },
>  };
> @@ -270,14 +270,14 @@ static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
>
>  static bool pwrc_ee_is_powered_off(struct meson_ee_pwrc_domain *pwrc_domain);
>
> -static struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
>         [PWRC_AXG_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, axg_pwrc_mem_vpu,
>                                      pwrc_ee_is_powered_off, 5, 2),
>         [PWRC_AXG_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
>         [PWRC_AXG_AUDIO_ID] = MEM_PD("AUDIO", axg_pwrc_mem_audio),
>  };
>
> -static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
>         [PWRC_G12A_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, g12a_pwrc_mem_vpu,
>                                      pwrc_ee_is_powered_off, 11, 2),
>         [PWRC_G12A_ETH_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
> @@ -287,13 +287,13 @@ static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
>                                     pwrc_ee_is_powered_off),
>  };
>
> -static struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {
>         [PWRC_GXBB_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, gxbb_pwrc_mem_vpu,
>                                      pwrc_ee_is_powered_off, 12, 2),
>         [PWRC_GXBB_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
>  };
>
> -static struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
>         [PWRC_MESON8_VPU_ID]  = VPU_PD("VPU", &meson8_pwrc_vpu,
>                                        meson8_pwrc_mem_vpu,
>                                        pwrc_ee_is_powered_off, 0, 1),
> @@ -303,7 +303,7 @@ static struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
>                                                 meson8_pwrc_audio_dsp_mem),
>  };
>
> -static struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
>         [PWRC_MESON8_VPU_ID]  = VPU_PD("VPU", &meson8_pwrc_vpu,
>                                        meson8_pwrc_mem_vpu,
>                                        pwrc_ee_is_powered_off, 11, 1),
> @@ -313,7 +313,7 @@ static struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
>                                                 meson8_pwrc_audio_dsp_mem),
>  };
>
> -static struct meson_ee_pwrc_domain_desc sm1_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc sm1_pwrc_domains[] = {
>         [PWRC_SM1_VPU_ID]  = VPU_PD("VPU", &sm1_pwrc_vpu, sm1_pwrc_mem_vpu,
>                                     pwrc_ee_is_powered_off, 11, 2),
>         [PWRC_SM1_NNA_ID]  = TOP_PD("NNA", &sm1_pwrc_nna, sm1_pwrc_mem_nna,
> @@ -576,32 +576,32 @@ static void meson_ee_pwrc_shutdown(struct platform_device *pdev)
>         }
>  }
>
> -static struct meson_ee_pwrc_domain_data meson_ee_g12a_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_g12a_pwrc_data = {
>         .count = ARRAY_SIZE(g12a_pwrc_domains),
>         .domains = g12a_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_axg_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_axg_pwrc_data = {
>         .count = ARRAY_SIZE(axg_pwrc_domains),
>         .domains = axg_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_gxbb_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_gxbb_pwrc_data = {
>         .count = ARRAY_SIZE(gxbb_pwrc_domains),
>         .domains = gxbb_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_m8_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_m8_pwrc_data = {
>         .count = ARRAY_SIZE(meson8_pwrc_domains),
>         .domains = meson8_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_m8b_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_m8b_pwrc_data = {
>         .count = ARRAY_SIZE(meson8b_pwrc_domains),
>         .domains = meson8b_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_sm1_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_sm1_pwrc_data = {
>         .count = ARRAY_SIZE(sm1_pwrc_domains),
>         .domains = sm1_pwrc_domains,
>  };
> --
> 2.49.0
>

