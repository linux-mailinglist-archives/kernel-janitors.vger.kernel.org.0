Return-Path: <kernel-janitors+bounces-4537-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F67A92B6AB
	for <lists+kernel-janitors@lfdr.de>; Tue,  9 Jul 2024 13:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6601EB250BC
	for <lists+kernel-janitors@lfdr.de>; Tue,  9 Jul 2024 11:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A42158851;
	Tue,  9 Jul 2024 11:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X0V4d5b2"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0861591F0
	for <kernel-janitors@vger.kernel.org>; Tue,  9 Jul 2024 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720523723; cv=none; b=NWDAT204qW0hXZBlbl4oHW5qwN2riIEreZWiZi4bYoPtD0hONxGYLxf47lAdhOGVKiqJar32dgQRqGePnQHrJ6D3eT0cx0FDOfQPTa1GnC/sYyduV8ISq32VzEsKcL+JaNufomjmquphdFoC2ge2PXo17tQ7IkhKY0SSzhxlMGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720523723; c=relaxed/simple;
	bh=8o9HK/XW5AhtJvK6eFRArwMqdWRhZ5tZPR9MnQJ5oeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ccNydSu3t/vu6M1lmjq/6yvksHFPwPuIisTl3Tc3sl7ALOP4OT493VbmbV9mtl87V9iy7h0yLgvbRJVaotq8+qSVf9ZVGFXdvqpu9jL90D0BqQsAQnnpetA+VXR+YzyB2rpBO8INWL0yNHtuEkNPojzxaDf0bWQ53SFAdKNGD6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X0V4d5b2; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-65465878c1fso39748957b3.2
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Jul 2024 04:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720523720; x=1721128520; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=amibtjMeBpHYdoWGEAnGfjOuZ2WN6rEsWzK1yJggVqI=;
        b=X0V4d5b2DHrmkHpMqUq9F2twFXuz8n8ts6uR4Dh+jUNW2oWTbAYztI1gbOD8g+BgfH
         Spcal3qkQShKInEPIS3kfg3F7+0+fcjuw3DXKxTzmtJpATbaeOea8nGGwe5YLzKoqKRG
         ns6Uxq3yRJ08F0r/BHPwTaUXUxqu8Zs+U52diS9v6itHkb08k0pNuxmg9eoxvNw5W4c8
         nRhlhExa+1uSHymJi9mGc22Zm1UQDc0KuN7cd2lIjbDGAQCGJf7kfZwRjgKw+SPIJJbk
         bvxWamXqKPKoDZKg12YUX1TP7q3Bs10UbL6JNueEoK7z8oqRUVcuEit4MjfRjV7rdHsu
         QbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720523720; x=1721128520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amibtjMeBpHYdoWGEAnGfjOuZ2WN6rEsWzK1yJggVqI=;
        b=Y9atLrQw7ofc3jFU5h9tdlp3tVegWAJk6pTbVDFC7Ux4vKXj3/+76IS5m6pzXng+M6
         Kj6yvyTExpNpzG8hWE5VYRKRtaXqS6SnDKDy+4zY9kOHuZqZ28tisbBgKM/UAS3WECzh
         M6WW12aq4S1rJuTdsTzidl5TNDb8HLQ20C7SxNI9XhNd/b5uFzdivkTTU6LVvlO2BUSr
         +xd0U6WCA0rQIYIzvOmohXbkYV949CB3rfwe8dj0zAu7kDABheqD+iYApCP/mtnYjeSC
         Bt1+M3QQzp+1nLzrgGNoYoVRf3Z8YEca3kReHfChokzMoASN3CziGInvL+fqSMzMUbSH
         +/Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWGid+RRy7FWT6N6zdIjwPOP8BARiKHimV9wcty8S6Ze5KNGx5UT9iQnjA3zg2dex4gAQxu+to3sTLhDH2AMbX13PxHcg/POkSckKYH1lXP
X-Gm-Message-State: AOJu0Yy4qwR/42DjIUGZrSidAEKqnTRalBsiMByzl7rfPlrZ2OPnrv9f
	Cj52wojGN9Gdmgcw7Q/qceSXuYDA65VN0E+uhCRb4enH32m5EJHbB0BSKm6KiuahWp1EOtqINfW
	Q9U/pleKFzwWdBBG00ZTVOrZmjsW4IRa2MFfsuA==
X-Google-Smtp-Source: AGHT+IFZPKT3QneE1vinb0l0LrB8IBVWI9enPV/6FaauTcqtNWGCxq5Rdp14ew2EtEqk25i4Zh3v1NHOT10WrvY4W2M=
X-Received: by 2002:a05:690c:7306:b0:64a:e7ec:f3d with SMTP id
 00721157ae682-658eed5eae3mr32126757b3.18.1720523719826; Tue, 09 Jul 2024
 04:15:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <871d6b708de8bb42e1fabd8a601dc9a9a217cf00.1719863475.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <871d6b708de8bb42e1fabd8a601dc9a9a217cf00.1719863475.git.christophe.jaillet@wanadoo.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 9 Jul 2024 13:14:43 +0200
Message-ID: <CAPDyKFprG1iwNDegi45d0KPWiZ7QNthGUWihY05UQ63MCvs=2A@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: Constify struct meson_secure_pwrc_domain_desc
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Jul 2024 at 21:53, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'struct meson_secure_pwrc_domain_desc' is not modified in this driver.
>
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text    data     bss     dec     hex filename
>    4909    4072       0    8981    2315 drivers/pmdomain/amlogic/meson-secure-pwrc.o
>
> After:
> =====
>    text    data     bss     dec     hex filename
>    8605     392       0    8997    2325 drivers/pmdomain/amlogic/meson-secure-pwrc.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Re-based and applied for next, thanks!

Kind regards
Uffe


> ---
> Compile tested-only.
>
> The .is_off() function is *always* set as pwrc_secure_is_off(), so it could
> make sense to remove this function pointer and call pwrc_secure_is_off()
> directly when needed.
> This would save some memory and useless indirection.
>
> I leave it as-is because it is maybe here for future use.
> ---
>  drivers/pmdomain/amlogic/meson-secure-pwrc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> index df5567418226..62857482f874 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> @@ -46,7 +46,7 @@ struct meson_secure_pwrc_domain_desc {
>
>  struct meson_secure_pwrc_domain_data {
>         unsigned int count;
> -       struct meson_secure_pwrc_domain_desc *domains;
> +       const struct meson_secure_pwrc_domain_desc *domains;
>  };
>
>  static bool pwrc_secure_is_off(struct meson_secure_pwrc_domain *pwrc_domain)
> @@ -110,7 +110,7 @@ static int meson_secure_pwrc_on(struct generic_pm_domain *domain)
>         .parent = __parent,                     \
>  }
>
> -static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
> +static const struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
>         SEC_PD(DSPA,    0),
>         SEC_PD(DSPB,    0),
>         /* UART should keep working in ATF after suspend and before resume */
> @@ -137,7 +137,7 @@ static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
>         SEC_PD(RSA,     0),
>  };
>
> -static struct meson_secure_pwrc_domain_desc a4_pwrc_domains[] = {
> +static const struct meson_secure_pwrc_domain_desc a4_pwrc_domains[] = {
>         SEC_PD(A4_AUDIO,        0),
>         SEC_PD(A4_SDIOA,        0),
>         SEC_PD(A4_EMMC, 0),
> @@ -155,7 +155,7 @@ static struct meson_secure_pwrc_domain_desc a4_pwrc_domains[] = {
>         SEC_PD(A4_AO_IR,        GENPD_FLAG_ALWAYS_ON),
>  };
>
> -static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
> +static const struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
>         SEC_PD(C3_NNA,          0),
>         SEC_PD(C3_AUDIO,        0),
>         SEC_PD(C3_SDIOA,        0),
> @@ -172,7 +172,7 @@ static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
>         SEC_PD(C3_VCODEC,       0),
>  };
>
> -static struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
> +static const struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
>         SEC_PD(S4_DOS_HEVC,     0),
>         SEC_PD(S4_DOS_VDEC,     0),
>         SEC_PD(S4_VPU_HDMI,     0),
> @@ -184,7 +184,7 @@ static struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
>         SEC_PD(S4_AUDIO,        0),
>  };
>
> -static struct meson_secure_pwrc_domain_desc t7_pwrc_domains[] = {
> +static const struct meson_secure_pwrc_domain_desc t7_pwrc_domains[] = {
>         SEC_PD(T7_DSPA,         0),
>         SEC_PD(T7_DSPB,         0),
>         TOP_PD(T7_DOS_HCODEC,   0, PWRC_T7_NIC3_ID),
> --
> 2.45.2
>

