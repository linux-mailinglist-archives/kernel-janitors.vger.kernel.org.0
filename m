Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3844DB9A6
	for <lists+kernel-janitors@lfdr.de>; Wed, 16 Mar 2022 21:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244688AbiCPUro (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 16 Mar 2022 16:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234104AbiCPUrn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 16 Mar 2022 16:47:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 02C1F2C6
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Mar 2022 13:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647463587;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FfhhJ7yUS0yyFlZxS6rDyNHEgGv69Jd6+/vC86VElHk=;
        b=ZKXfXm+Z4+CyqoG8BgjWkB0MPtbRbiEo8UAHXABX+ygWJhvq9U3p+PNpIpqfQ4H2tbj585
        PqTT82/rxXqgSzG3c7ZLMH6mSVfTeOZ3h3C4mKP4qBWEvxGJEm/pOmb8/5+o8gYyuWHj2x
        bilugcd52fcZS6hsOd3W6s7O5goBw5o=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-P3xux3baPzmy8ud9PRT68Q-1; Wed, 16 Mar 2022 16:46:25 -0400
X-MC-Unique: P3xux3baPzmy8ud9PRT68Q-1
Received: by mail-qt1-f198.google.com with SMTP id f22-20020ac840d6000000b002dd4d87de21so2187751qtm.23
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Mar 2022 13:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=FfhhJ7yUS0yyFlZxS6rDyNHEgGv69Jd6+/vC86VElHk=;
        b=xW3LygkJOykieH3Ik+KbOXHx+O1OZL07YgbyXGUsvMvzSTq9Gok1A3T045nTfwWDXp
         SnmxHugipxIIGR/SgyIctZ4T2bQsXiaJWLK3TnnKuSLua1852eYlwncUhqoKnBCOC54A
         SGTeQb3nl+0DjzprxUoaa+vU6iAm4kjcwWFkbGE4Jn7cpc8OiAlPbce7Pm9I8zZmmO9X
         BKIVCYTINtXNJ7kT4nMwQYy58tuTZkZMhaVrfDzeUZpzkq395UEgoCSKRY9zUhFdoZ4c
         Dq1G9ZMvrJDh31dLb4xjLwsf4qusTkLTsPqPu5QD5HAVICrViJwQoJ0kuQRrwbCo28rr
         uZCw==
X-Gm-Message-State: AOAM530HgbBdH53XSPL4I7DuWN1D9Zma+4aHJljGnVpARpaPWdgdf9eM
        nAqKeB2vQ+bOqNOBKeiNptfD8UcHiWpa6r6Fak+JM6jVPMWbXtjyOd9+diMtfUn9ORqpuGqvcTW
        Mvjvjrw37VPp9hm9/3PRJt7Qv/Tdn
X-Received: by 2002:a05:6214:2aa8:b0:440:e21a:481e with SMTP id js8-20020a0562142aa800b00440e21a481emr920496qvb.124.1647463585470;
        Wed, 16 Mar 2022 13:46:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhGOJ38oQnyB4tkZz/yMIApAMry1UbUhBbTBbzmqYsaCSF25WehrTI7qOdDymlw16Z2KFyKg==
X-Received: by 2002:a05:6214:2aa8:b0:440:e21a:481e with SMTP id js8-20020a0562142aa800b00440e21a481emr920483qvb.124.1647463585243;
        Wed, 16 Mar 2022 13:46:25 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net. [96.230.100.15])
        by smtp.gmail.com with ESMTPSA id f185-20020a37d2c2000000b0067e342d5e4dsm416449qkj.105.2022.03.16.13.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 13:46:24 -0700 (PDT)
Message-ID: <473115e2ed01b0d47ae74d29d6f8f66286a78ccb.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Fix spelling mistake "endianess" ->
 "endianness"
From:   Lyude Paul <lyude@redhat.com>
To:     Colin Ian King <colin.i.king@gmail.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 16 Mar 2022 16:46:23 -0400
In-Reply-To: <20220315221929.2959700-1-colin.i.king@gmail.com>
References: <20220315221929.2959700-1-colin.i.king@gmail.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in just a moment

On Tue, 2022-03-15 at 22:19 +0000, Colin Ian King wrote:
> There is a spelling mistake in a nvdev_error error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index 88d262ba648c..62efbd0f3846 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -2935,7 +2935,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>                 /* switch mmio to cpu's native endianness */
>                 if (!nvkm_device_endianness(device)) {
>                         nvdev_error(device,
> -                                   "Couldn't switch GPU to CPUs
> endianess\n");
> +                                   "Couldn't switch GPU to CPUs
> endianness\n");
>                         ret = -ENOSYS;
>                         goto done;
>                 }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

