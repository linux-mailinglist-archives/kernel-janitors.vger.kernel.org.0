Return-Path: <kernel-janitors+bounces-511-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 618017FE9A1
	for <lists+kernel-janitors@lfdr.de>; Thu, 30 Nov 2023 08:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3B8AB20DCC
	for <lists+kernel-janitors@lfdr.de>; Thu, 30 Nov 2023 07:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D9A1F5FE;
	Thu, 30 Nov 2023 07:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XpUqFFLb"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83F519F
	for <kernel-janitors@vger.kernel.org>; Wed, 29 Nov 2023 23:22:04 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40b27726369so5095255e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Nov 2023 23:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701328923; x=1701933723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jCVSepYz7QF9MkiDMTMU+npZtNxv/TqmAOPsBI5HcaE=;
        b=XpUqFFLbWcJI13JzV0bcvRjzavuddvPtImPEKdEDknRSfyP/U+zlS/HUjd/nMx92mX
         O3DlCrECN1/MtXVWTxtGntIyXvuqS2KcchVAXyda8vvJ6fayqfbiAkIbt3vmcoRiZdkw
         fV6PGgonzZydIdWox/20MRIFU2N64YSMns4pk/RGGZctHTOHqMXPmFRAJxg70Ihjaxzu
         Yetm5QUfeEp2rTeQiBnM3oqw7Xs0N4mdG20YplJb+s2kTxtjWhkQWuVM6Edbt/g51nG0
         mv8jo5MdVJeT+u78p0yFu8YfyXUUlOhIufuf9Pa2rcA4Q5NPkdJXK19U9m8/T/It/4uc
         E6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701328923; x=1701933723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCVSepYz7QF9MkiDMTMU+npZtNxv/TqmAOPsBI5HcaE=;
        b=rC93/4lRwuVdGsqiZVckJA0MuncPj8azDonxKSvO+tWDWwxInq1ZjPhTEZs2tOphoK
         gutBQia80s5kDKs3rqLHxwmDkXYguQCeTk4VB27pA4VeJDWDJLj881Dhv1vvwb8lS46e
         nF7VWdEVSPZowL66pGkWLV2Lb8OESdclrHETTkrmad92Sr+WRZluHzKieuTXjLTjx1pc
         JNPpbVyo9arpLUr9V+FYHcuz4Hbgj5qMekwupuOOgG5xxLow+8HJ5UnDqLyIFYfP5kdZ
         ZMkgY1CxqW74Zxsxj3ZLPprkfcxPhm3BEzNl89JTUnpWC4k7F0FR4DAKNSGVwyBtpCzY
         ptxg==
X-Gm-Message-State: AOJu0YykyM7I2zLPaZZv9PaLc+A7otgN+gPOHY1UwmdK48piySCIRmIb
	C3v4YkoDnxHhrkJC71uPW16k4Q==
X-Google-Smtp-Source: AGHT+IGk+rDb1h//M4tTiPZElnq6JRAnVxjdPzWt+ekkbJ/hZroQB7tWT5yRNSimPEY6tv4vRTbjbQ==
X-Received: by 2002:a05:600c:1c0a:b0:405:39b4:3145 with SMTP id j10-20020a05600c1c0a00b0040539b43145mr11833891wms.2.1701328923224;
        Wed, 29 Nov 2023 23:22:03 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r16-20020a05600c459000b00406408dc788sm4580559wmo.44.2023.11.29.23.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 23:22:02 -0800 (PST)
Date: Thu, 30 Nov 2023 10:21:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: hare@suse.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] scsi: aic7xxx: fix some problem of return value
Message-ID: <1784b008-6eb2-4dc8-ae21-b0b2c18760bf@suswa.mountain>
References: <20231130024122.1193324-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130024122.1193324-1-suhui@nfschina.com>

On Thu, Nov 30, 2023 at 10:41:23AM +0800, Su Hui wrote:
>  	ahc = ahc_alloc(&aic7xxx_driver_template, name);
>  	if (ahc == NULL)
> -		return (ENOMEM);
> +		return -ENOMEM;
>  	ahc->dev = dev;
>  	error = aic7770_config(ahc, aic7770_ident_table + edev->id.driver_data,
>  			       eisaBase);
>  	if (error != 0) {
>  		ahc->bsh.ioport = 0;
>  		ahc_free(ahc);
> -		return (error);
> +		return -error;

aic7770_config() mostly returns positive error codes but I see it also
return -1 from ahc_reset().  So you'd want to do something like:

	return error < 0 ? error : -error;



>  	}
>  
>   	dev_set_drvdata(dev, ahc);
>  
>  	error = ahc_linux_register_host(ahc, &aic7xxx_driver_template);
> -	return (error);
> +	return -error;
>  }
>  
>  static int
> diff --git a/drivers/scsi/aic7xxx/aic7xxx_osm.c b/drivers/scsi/aic7xxx/aic7xxx_osm.c
> index 4ae0a1c4d374..158aaeca8941 100644
> --- a/drivers/scsi/aic7xxx/aic7xxx_osm.c
> +++ b/drivers/scsi/aic7xxx/aic7xxx_osm.c
> @@ -1117,7 +1117,7 @@ ahc_linux_register_host(struct ahc_softc *ahc, struct scsi_host_template *templa
>  	if (retval) {
>  		printk(KERN_WARNING "aic7xxx: scsi_add_host failed\n");
>  		scsi_host_put(host);
> -		return retval;
> +		return -retval;

Originally ahc_linux_register_host() returned a mix of positive and
negative error codes.  You have converted it to return only positive
error codes.  That's good for consistency in a way, but it's a step
backwards from the big picture point of view.


>  	}
>  
>  	scsi_scan_host(host);
> diff --git a/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c b/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c
> index a07e94fac673..e17eb8df12c4 100644
> --- a/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c
> +++ b/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c
> @@ -241,8 +241,8 @@ ahc_linux_pci_dev_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		ahc_linux_pci_inherit_flags(ahc);
>  
>  	pci_set_drvdata(pdev, ahc);
> -	ahc_linux_register_host(ahc, &aic7xxx_driver_template);
> -	return (0);
> +	error = ahc_linux_register_host(ahc, &aic7xxx_driver_template);
> +	return -error;

This should be done in a separate patch.

patch 1: return negative error codes in ahc_linux_register_host()
patch 2: return negative error codes in aic7770_probe()
patch 3: add a check for errors in ahc_linux_pci_dev_probe()

regards,
dan carpenter


