Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4145CA4985
	for <lists+kernel-janitors@lfdr.de>; Sun,  1 Sep 2019 15:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728808AbfIANE1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 1 Sep 2019 09:04:27 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:24779 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728523AbfIANE1 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 1 Sep 2019 09:04:27 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id 0132F202E6;
        Sun,  1 Sep 2019 15:04:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1567343061; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cmuiLNx59FAbCP+7FsHaTn/I0tfyukO/aP7TjQYzfIY=;
        b=0C4wWla/mdUxWVEJt9RCqv6PQoVhzzVrWooKZpOJXIIj/z5AprwZXmTQhimS36ThwzBXbZ
        xea9FWTS2Wnghkn4cQfB1TEhbD4p9vVXSu0AiOH/CYU5ebPaW+XKDyd7S1RSg4Cd7/qsaP
        EoOdOYzB/pSyl7BFJykKS3Jdscu0vww11QTpdgZQMVBkT5Ygj82vIJxzZyrFGCbhXb7kN0
        U6XZRHx0OZCGJBwupE0nHoEYxZhxgzzh74X5OXoIJ2I65d1Hs879a5PUMNL2OpYy9p80Ds
        OJJqD+7GAvseTgJ5g0jfKzqq9arINQbjc/BVRoXSrwYQ9BSiw0f63eS8JlkGBA==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id CA788BEEBD;
        Sun,  1 Sep 2019 15:04:20 +0200 (CEST)
Message-ID: <5D6BC1D3.7040605@bfs.de>
Date:   Sun, 01 Sep 2019 15:04:19 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     YueHaibing <yuehaibing@huawei.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH -next] scsi: smartpqi: remove set but not used variable
 'ctrl_info'
References: <20190831130348.20552-1-yuehaibing@huawei.com>
In-Reply-To: <20190831130348.20552-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.10
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
         TO_DN_EQ_ADDR_SOME(0.00)[];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         TO_DN_SOME(0.00)[];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         RCPT_COUNT_TWO(0.00)[2];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-3.00)[100.00%];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.999,0];
         RCVD_COUNT_TWO(0.00)[2];
         RCVD_TLS_ALL(0.00)[]
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



Am 31.08.2019 15:03, schrieb YueHaibing:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/scsi/smartpqi/smartpqi_init.c: In function 'pqi_driver_version_show':
> drivers/scsi/smartpqi/smartpqi_init.c:6164:24: warning:
>  variable 'ctrl_info' set but not used [-Wunused-but-set-variable]
> 
> commit 6d90615f1346 ("scsi: smartpqi: add sysfs entries") add it but never
> use, so remove it also variable 'shost'
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/scsi/smartpqi/smartpqi_init.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
> index ea5409bebf57..b9e7dabee1e5 100644
> --- a/drivers/scsi/smartpqi/smartpqi_init.c
> +++ b/drivers/scsi/smartpqi/smartpqi_init.c
> @@ -6160,12 +6160,6 @@ static ssize_t pqi_firmware_version_show(struct device *dev,
>  static ssize_t pqi_driver_version_show(struct device *dev,
>  	struct device_attribute *attr, char *buffer)
>  {
> -	struct Scsi_Host *shost;
> -	struct pqi_ctrl_info *ctrl_info;
> -
> -	shost = class_to_shost(dev);
> -	ctrl_info = shost_to_hba(shost);
> -
>  	return snprintf(buffer, PAGE_SIZE,
>  		"%s\n", DRIVER_VERSION BUILD_TIMESTAMP);
>  }
> 

so, only snprintf() is left. That begs an other question:
Is that function need at all or can it be replaced with snprintf() ?

re,
 wh

