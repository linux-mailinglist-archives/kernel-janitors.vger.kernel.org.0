Return-Path: <kernel-janitors+bounces-950-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03610820ACD
	for <lists+kernel-janitors@lfdr.de>; Sun, 31 Dec 2023 10:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 676611F21D78
	for <lists+kernel-janitors@lfdr.de>; Sun, 31 Dec 2023 09:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC892115;
	Sun, 31 Dec 2023 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ph9j5pKr"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C365686
	for <kernel-janitors@vger.kernel.org>; Sun, 31 Dec 2023 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704015571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2M8envGKjHlB+rbsNvUg7dTUJ+CJggG85VpaK06plHQ=;
	b=Ph9j5pKr2Q6L6EVr7ul+DxRjNgUp6sf9nGywsmjiNTfQ92BxMUVNgbJgiT/FMqSuaMal+z
	E7cpii+5JaYx6NmzywH+HR3kwkREEQ/rOByAyWldvLpX4HN9ndCn3ycz2ITslsLWNEASSp
	u880p99/70llxURyxRJmS9R44qxUpTk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-2z5pvKV2PBWPhk-SwpGMoA-1; Sun, 31 Dec 2023 04:39:29 -0500
X-MC-Unique: 2z5pvKV2PBWPhk-SwpGMoA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-55369c474e1so4495906a12.0
        for <kernel-janitors@vger.kernel.org>; Sun, 31 Dec 2023 01:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704015568; x=1704620368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2M8envGKjHlB+rbsNvUg7dTUJ+CJggG85VpaK06plHQ=;
        b=NInE7oV9C2Qfg8ubwqYK+6yPiL31j0TeZd6rKPD4Bk4kwhNwrI7+EZmT7m+2hjPvn1
         mbOPuQn+ZCHZ30kvrBC8Y8r6n5c8ovHIqAGYCg6TuI4y3pDMR2AruQJ1lB8dNXp56ImA
         xoHVynNPIvTqmSt4/T4JZd/stc1HsdPo1Ng8RDAs67DNc4uBhPNrfUtuAGBAKhlaTuOb
         /mBk27EYcXzLSlDyIRCGmJ2MXy4qTPKrS12VzzmxnzqqKGQiJGS1f6oUaEx7I+b7tkhX
         7PLOLMXInk5vkv5/96P8FZuAxoo5qEnQplWDz7nQuHwXw+p1N7texSUNg7hbfqWe7cez
         IfCw==
X-Gm-Message-State: AOJu0Yxy3VgnpA0HKKP87Z2sJ6HwAByorRSiBvuuDvPFT2i+GvhsU/Fa
	7p5LUddOwTR9Tf86+DQJQn/fqpo2nJrwKFsBXCYW0YVPAoTzNFBgxOOP+FJRGHIAZBLL1AcLEdf
	Q+VmpZHWt4Hi2iS3MJcWM7T79R+AFkdyhSzV9
X-Received: by 2002:aa7:c74f:0:b0:554:dda2:dd63 with SMTP id c15-20020aa7c74f000000b00554dda2dd63mr3444205eds.157.1704015568370;
        Sun, 31 Dec 2023 01:39:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEB6SHiQywZWugTxbIp3r3mAW8+8OP1SVppgq+gYDSvDuHO0HoVJn1ZJpVbUgKQm/N94n+/iQ==
X-Received: by 2002:aa7:c74f:0:b0:554:dda2:dd63 with SMTP id c15-20020aa7c74f000000b00554dda2dd63mr3444194eds.157.1704015568115;
        Sun, 31 Dec 2023 01:39:28 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ew10-20020a056402538a00b005546ba152f4sm10900308edb.71.2023.12.31.01.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:39:27 -0800 (PST)
Message-ID: <fec812d4-1d69-46cb-9ad1-9634f0062a5f@redhat.com>
Date: Sun, 31 Dec 2023 10:39:27 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] media: atomisp: remove redundant assignments to
 variables
Content-Language: en-US, nl
To: Colin Ian King <colin.i.king@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231219143929.367929-1-colin.i.king@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231219143929.367929-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/19/23 15:39, Colin Ian King wrote:
> There are several variables that are being initialized with values
> that are never read, the assignment are redundant and can be removed.
> Cleans up cppcheck unreadVariable warnings.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  .../atomisp/pci/base/circbuf/src/circbuf.c     |  2 +-
>  .../pci/runtime/pipeline/src/pipeline.c        |  4 +---
>  .../atomisp/pci/runtime/queue/src/queue.c      | 18 +++++++++---------
>  3 files changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> index d9f7c143794d..06f039236abc 100644
> --- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> +++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> @@ -207,7 +207,7 @@ bool ia_css_circbuf_increase_size(
>  {
>  	u8 curr_size;
>  	u8 curr_end;
> -	unsigned int i = 0;
> +	unsigned int i;
>  
>  	if (!cb || sz_delta == 0)
>  		return false;
> diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
> index 3d8741e7d5ca..966cb47b95d9 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
> @@ -693,7 +691,7 @@ static void pipeline_init_defaults(
>  static void ia_css_pipeline_set_zoom_stage(struct ia_css_pipeline *pipeline)
>  {
>  	struct ia_css_pipeline_stage *stage = NULL;
> -	int err = 0;
> +	int err;
>  
>  	assert(pipeline);
>  	if (pipeline->pipe_id == IA_CSS_PIPE_ID_PREVIEW) {
> diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
> index 2f1c2df59f71..c4d4062206a2 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
> @@ -81,7 +81,7 @@ int ia_css_queue_uninit(ia_css_queue_t *qhandle)
>  
>  int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
>  {
> -	int error = 0;
> +	int error;
>  
>  	if (!qhandle)
>  		return -EINVAL;
> @@ -138,7 +138,7 @@ int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
>  
>  int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
>  {
> -	int error = 0;
> +	int error;
>  
>  	if (!qhandle || NULL == item)
>  		return -EINVAL;
> @@ -193,7 +193,7 @@ int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
>  
>  int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
>  {
> -	int error = 0;
> +	int error;
>  
>  	if ((!qhandle) || (!is_full))
>  		return -EINVAL;
> @@ -225,7 +225,7 @@ int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
>  
>  int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
>  {
> -	int error = 0;
> +	int error;
>  
>  	if ((!qhandle) || (!size))
>  		return -EINVAL;
> @@ -257,7 +257,7 @@ int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
>  
>  int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
>  {
> -	int error = 0;
> +	int error;
>  
>  	if ((!qhandle) || (!size))
>  		return -EINVAL;
> @@ -289,8 +289,8 @@ int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
>  
>  int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
>  {
> -	u32 num_elems = 0;
> -	int error = 0;
> +	u32 num_elems;
> +	int error;
>  
>  	if ((!qhandle) || (!element))
>  		return -EINVAL;
> @@ -338,7 +338,7 @@ int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
>  
>  int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
>  {
> -	int error = 0;
> +	int error;
>  
>  	if ((!qhandle) || (!is_empty))
>  		return -EINVAL;
> @@ -370,7 +370,7 @@ int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
>  
>  int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
>  {
> -	int error = 0;
> +	int error;
>  
>  	if ((!qhandle) || (!size))
>  		return -EINVAL;


