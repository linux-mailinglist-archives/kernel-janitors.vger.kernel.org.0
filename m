Return-Path: <kernel-janitors+bounces-617-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 545CB80A255
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Dec 2023 12:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E924CB20B9D
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Dec 2023 11:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB04F1B291;
	Fri,  8 Dec 2023 11:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MlculCWy"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FC61720
	for <kernel-janitors@vger.kernel.org>; Fri,  8 Dec 2023 03:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702035341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=56LbxjAYxWjvG44Vq3GcHH61dclQGaGcbqQRT67zl+k=;
	b=MlculCWyMVXemfKf27DvP/Pc4105SQsOrzLpUcszZG3whP95aa4fB36yKfqbVKpG6Eq6DI
	0oUjEEGF4VQR2xbnq/hN91MYVIbP5DycOodHCRqYFO/5DM7eRl8qUdBx4gdXX4mnTXF/Ps
	5Wt5ahGd8M+WONd9fYxoW+yClWPVWcs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-VnEvKGZuNd-gMBIbIrvNlg-1; Fri, 08 Dec 2023 06:35:39 -0500
X-MC-Unique: VnEvKGZuNd-gMBIbIrvNlg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a1c989d460eso125873566b.1
        for <kernel-janitors@vger.kernel.org>; Fri, 08 Dec 2023 03:35:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702035338; x=1702640138;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56LbxjAYxWjvG44Vq3GcHH61dclQGaGcbqQRT67zl+k=;
        b=c7L/0IeaZH8poUHY2PxDCVHpD18VKeOUZ4TVP+pdDnruy7P0s0OEUJoqvgAYIoMWkS
         aUfN22UaaWfZyBRy+oa1+jaT3HKFprSKVunCNayUESWwoZ0Wtj2kuwAsxWmPnJEYfRAG
         IFHkAMOIpq9rhnY7dNdBYWb8m+jkH77THyj7nzm42rWoCRf565IbeHjcokG/9uigdbf8
         +62HEzabzpl4RR8hr+RZcJZIP0ZU3H9JBfm4jJ701FvNFSPSUh8ZCqvAQsqni04bxlkT
         YpqYttVrgRS1r4ysMBw69qkSbWI5GsRfoDmFsozuQ3i02atPhOxo2yltr78NDnFjUMrw
         1PXQ==
X-Gm-Message-State: AOJu0Ywx5Txui2joaykPlp1F6SGGv9va4A5P4XJcZnmTFASbcsZLAHE/
	Rck9aixR2GNc1Zy1FY+XWdoQYpZLCrVzFUueTaXAkkkeYqmkzdlGqW39cErUGDvDT6E2+ktuS62
	wR2ISjp2Z4/7kcR21MQaZymQcOyys
X-Received: by 2002:a17:906:189:b0:a02:a2cc:66b8 with SMTP id 9-20020a170906018900b00a02a2cc66b8mr2833878ejb.14.1702035338438;
        Fri, 08 Dec 2023 03:35:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIwMj2tOIobb8zgpJMmlUrCA0d6r8aJyQc86j4Rx04MnRIR+/iDl1ClyT7OuhvjQNv/lzFpQ==
X-Received: by 2002:a17:906:189:b0:a02:a2cc:66b8 with SMTP id 9-20020a170906018900b00a02a2cc66b8mr2833871ejb.14.1702035338098;
        Fri, 08 Dec 2023 03:35:38 -0800 (PST)
Received: from redhat.com ([2a02:14f:1f0:7466:b10d:58c8:869f:7e91])
        by smtp.gmail.com with ESMTPSA id cw15-20020a170907160f00b00a1937153bddsm898831ejd.20.2023.12.08.03.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 03:35:37 -0800 (PST)
Date: Fri, 8 Dec 2023 06:35:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jason Wang <jasowang@redhat.com>,
	Wu Zongyong <wuzongyong@linux.alibaba.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH] vdpa: Fix an error handling path in eni_vdpa_probe()
Message-ID: <20231208063520-mutt-send-email-mst@kernel.org>
References: <a7b0ef1eabd081f1c7c894e9b11de01678e85dee.1666293559.git.christophe.jaillet@wanadoo.fr>
 <72a89724-9dad-499a-a0ed-ad9d046d235d@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72a89724-9dad-499a-a0ed-ad9d046d235d@wanadoo.fr>

On Thu, Dec 07, 2023 at 10:13:51PM +0100, Christophe JAILLET wrote:
> Le 20/10/2022 � 21:21, Christophe JAILLET a �crit�:
> > After a successful vp_legacy_probe() call, vp_legacy_remove() should be
> > called in the error handling path, as already done in the remove function.
> > 
> > Add the missing call.
> > 
> > Fixes: e85087beedca ("eni_vdpa: add vDPA driver for Alibaba ENI")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >   drivers/vdpa/alibaba/eni_vdpa.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/vdpa/alibaba/eni_vdpa.c b/drivers/vdpa/alibaba/eni_vdpa.c
> > index 5a09a09cca70..cce3d1837104 100644
> > --- a/drivers/vdpa/alibaba/eni_vdpa.c
> > +++ b/drivers/vdpa/alibaba/eni_vdpa.c
> > @@ -497,7 +497,7 @@ static int eni_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >   	if (!eni_vdpa->vring) {
> >   		ret = -ENOMEM;
> >   		ENI_ERR(pdev, "failed to allocate virtqueues\n");
> > -		goto err;
> > +		goto err_remove_vp_legacy;
> >   	}
> >   	for (i = 0; i < eni_vdpa->queues; i++) {
> > @@ -509,11 +509,13 @@ static int eni_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >   	ret = vdpa_register_device(&eni_vdpa->vdpa, eni_vdpa->queues);
> >   	if (ret) {
> >   		ENI_ERR(pdev, "failed to register to vdpa bus\n");
> > -		goto err;
> > +		goto err_remove_vp_legacy;
> >   	}
> >   	return 0;
> > +err_remove_vp_legacy:
> > +	vp_legacy_remove(&eni_vdpa->ldev);
> >   err:
> >   	put_device(&eni_vdpa->vdpa.dev);
> >   	return ret;
> 
> Polite reminder on a (very) old patch.
> 
> CJ


Tagged now, thanks!


