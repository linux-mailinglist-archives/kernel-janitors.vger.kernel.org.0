Return-Path: <kernel-janitors+bounces-6299-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 037059B9368
	for <lists+kernel-janitors@lfdr.de>; Fri,  1 Nov 2024 15:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F30F1F23F35
	for <lists+kernel-janitors@lfdr.de>; Fri,  1 Nov 2024 14:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0BE91A76BB;
	Fri,  1 Nov 2024 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hGC9a255"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D5B49620
	for <kernel-janitors@vger.kernel.org>; Fri,  1 Nov 2024 14:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730471847; cv=none; b=rmQpJgmjNyFruMXT44K98pEj6amZZsNg3yiC1ecRb2wYM9Gt2b7RsfoM0yfsBeZhfGVDrqkTHOB+WCYRj+ibewKZDP7RDGcbktZrsZ5oiMOgQ9waoHrdEyLyHGIyHagup2rFsCzqmpDdEvw++cu3mHPQ2w9BPiH4jXEGPE3PiIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730471847; c=relaxed/simple;
	bh=xihCVwmbBEbROkwdBiHwl8sFUTycGVe7moUKh5exmVY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WQ+GrzuBF3IfcLAPga96BZVskzUUFQy9oZXwzfmKmGYG5VnmHgPW7TS2+7m8MeACc1Q5U+5C7BLmUz6/8gVjQ1MpZa5+0nPLEY4WgiUYTxLwI+SvaVobJlFXrNd5sgAHhK77KIoKHdwRFEeSbaFrZoB94vfcXGD2QAYGBL8I+3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hGC9a255; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730471844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eq2uqU7pkfVUiFU7SkoeHtKd6J30m6LjXgrS5SpQUqE=;
	b=hGC9a255qNaRnCPB6I6k/ohYrByPae3n9ivTD94WW6PFdQx5Tf5Zm382OXFuQrkWCkex6U
	uZlGNHndeJ0f4pZJSlbTsrlw6BSR2t34Iw1XtiVltnblaJZBgELt5MAEuSY1SpWuI/goGw
	RVmkK3IVJ2YusyIVt4whMg3q56uQL1Y=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-JkV8_huQNZWWGZXTZkM01Q-1; Fri, 01 Nov 2024 10:37:23 -0400
X-MC-Unique: JkV8_huQNZWWGZXTZkM01Q-1
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a6baffc7f9so122105ab.1
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Nov 2024 07:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471842; x=1731076642;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eq2uqU7pkfVUiFU7SkoeHtKd6J30m6LjXgrS5SpQUqE=;
        b=mvUpFQBAfRgW8xoVNPhGtZUU/WeW1/ubJ18glXGCp7T3dUikWOkEB060BZEmXpoNnC
         /LO3iUSooKbGhT8G9jo40SYIn1aq36CPYvSML+OSGoLVJ12bHxYG0T+7hM9jaF0jQL/c
         34TfvT5PECf3ltQefVTc7vXDyRWfTrQ2p4W0b+6LkwqSz3RmMIo9374zfr7n/731N2i0
         DfgQicuW9HqqkcU9ODo9fKwRPmXI0DXuaa2uaBflgoCaUi9f+fLNljDGri5J0XbCdaTs
         bO6t64pwvUXdRXfVtQzgpQvF/4xgk8Xsy3vWvhpPdbRmflb/GITaq8YtdYnQFEW80ysE
         uNjA==
X-Forwarded-Encrypted: i=1; AJvYcCWSRUPo+R8o35u56rt7RNp9SllefdmQYEaRzr+CW0VsvflQjOculCnp3zEPgVvGjH2Gn34IfDOSddkLzQzK7/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvJ8iiQV78CtPaqKRELoX5XdfiLtZfGio8Qqhf/WT6y3kG+qi0
	uC77u/VNGFd+A/3AubiIQFUGvWv84tx0x1C+dxqtS62kzMq2Q/IiiCSIeCfULhyO1plH+vDkpBf
	bjRHIifmBev2d48Dps5ZpTxU+/XEu0rrEAmvqLf958OFbAOKspIyOfVGM6Gmjhif2xLINMQwWZg
	==
X-Received: by 2002:a05:6e02:148a:b0:3a6:b445:dcac with SMTP id e9e14a558f8ab-3a6b445dd73mr4761795ab.2.1730471842026;
        Fri, 01 Nov 2024 07:37:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvn5Vfsqs7qjJ8UOjFRtJ1SimPwyE/4ForKOavSr8aFXtbAKn8m8XJIDuFJ3eIu1sfmTnmTg==
X-Received: by 2002:a05:6e02:148a:b0:3a6:b445:dcac with SMTP id e9e14a558f8ab-3a6b445dd73mr4761755ab.2.1730471841650;
        Fri, 01 Nov 2024 07:37:21 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de04aca865sm743386173.169.2024.11.01.07.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:37:21 -0700 (PDT)
Date: Fri, 1 Nov 2024 08:37:18 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH] kvm/vfio: Constify struct kvm_device_ops
Message-ID: <20241101083718.32f1657a.alex.williamson@redhat.com>
In-Reply-To: <e7361a1bb7defbb0f7056b884e83f8d75ac9fe21.1727517084.git.christophe.jaillet@wanadoo.fr>
References: <e7361a1bb7defbb0f7056b884e83f8d75ac9fe21.1727517084.git.christophe.jaillet@wanadoo.fr>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 28 Sep 2024 11:52:46 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> 'struct kvm_device_ops' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    2605	    169	     16	   2790	    ae6	virt/kvm/vfio.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    2685	     89	     16	   2790	    ae6	virt/kvm/vfio.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---
>  virt/kvm/vfio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
> index 388ae471d258..e72a6a1d5a20 100644
> --- a/virt/kvm/vfio.c
> +++ b/virt/kvm/vfio.c
> @@ -353,7 +353,7 @@ static void kvm_vfio_release(struct kvm_device *dev)
>  
>  static int kvm_vfio_create(struct kvm_device *dev, u32 type);
>  
> -static struct kvm_device_ops kvm_vfio_ops = {
> +static const struct kvm_device_ops kvm_vfio_ops = {
>  	.name = "kvm-vfio",
>  	.create = kvm_vfio_create,
>  	.release = kvm_vfio_release,

Applied to vfio next branch for v6.13.  Thanks,

Alex


