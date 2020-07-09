Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C1321A5BD
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 Jul 2020 19:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbgGIRZy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 9 Jul 2020 13:25:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37091 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727061AbgGIRZx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Jul 2020 13:25:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594315552;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ayL2zRv44zVA/vI/qKLO5dT3uiTyNFjJ4KJMkaO+qQI=;
        b=J73y+bMPdnIGMDWCHkX869bnwSUpf2LHoAmTAiVkl6UJbP8FoCq08R4mHZW7fG6UnBzW/R
        3mPc2SdJm16B3Y0L4v0TkVkA6KPGsZXJzOJHI0OptcLfwypzxLUDj8Jz9gRlSZhxdapG2g
        FeOG2QTbcUIROPPaCq59grv4futADEg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-lYHWPKUMNuuFg7T6W5D6EQ-1; Thu, 09 Jul 2020 13:25:50 -0400
X-MC-Unique: lYHWPKUMNuuFg7T6W5D6EQ-1
Received: by mail-wm1-f72.google.com with SMTP id t18so2843641wmj.5
        for <kernel-janitors@vger.kernel.org>; Thu, 09 Jul 2020 10:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ayL2zRv44zVA/vI/qKLO5dT3uiTyNFjJ4KJMkaO+qQI=;
        b=Mnbil/EX8/HpMYlpMNLdqpwqlefEy3N4oHEfcUdDxaLucylV5CQyyXxUW2mcoGb3ns
         /UvZU9KdRMoo8hyHTFVCiONgOnyKja+DWO5jEu3cfO45r1nfYWHOTy+cWramtoLEJcHA
         Zvh8PXesm4FlQNY6TrcKDRMr6KSSkhW5G4OIT3R/5Nz5smL9CyYOx4kLcHl38LxUjerc
         CbfNj2dkYiLHBQ/QR796inGDVjA0LdVihYH9J4T7OKKOF2ErsT3itw5n+doZ/soT5ZFy
         f9lciX4ZpiUH/gFiVWFHPei3Zff0QzyLQW02ecQtp0hm5E0JqsKI2NrYvPW12T4pZpHF
         eDMA==
X-Gm-Message-State: AOAM530y6LqPtPL2rmcMSyZRfXIBGPxQZBeJPBtqNgTrB4IJjiXR2a9g
        G634ovdpqcXVVUr4KFf023mpLame9eXjppfbB7I2QFX1NH2WAxwlzRYSBfnrVLmBbKUIomWIXgw
        OGrT1pO79ACg7T6bye2Igxo4EzOsm
X-Received: by 2002:a1c:28a:: with SMTP id 132mr1009953wmc.109.1594315549630;
        Thu, 09 Jul 2020 10:25:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2sedbzLwqgP/3k7XdcalLS7M8QME+eSe2xcF5rOIoSPUGVWnnJi2vGFbzZPqABCs7ueR2IQ==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr1009940wmc.109.1594315549388;
        Thu, 09 Jul 2020 10:25:49 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c? ([2001:b07:6468:f312:9541:9439:cb0f:89c])
        by smtp.gmail.com with ESMTPSA id c15sm5608087wme.23.2020.07.09.10.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 10:25:48 -0700 (PDT)
Subject: Re: [PATCH] scsi: virtio_scsi: Remove unnecessary condition checks
To:     Markus Elfring <Markus.Elfring@web.de>,
        Xianting Tian <xianting_tian@126.com>,
        linux-scsi@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        "James E. J. Bottomley" <jejb@linux.ibm.com>,
        Jason Wang <jasowang@redhat.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>
References: <a197f532-7020-0d8e-21bf-42bb66e8daec@web.de>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e87746e6-813e-7c0e-e21e-5921e759da5d@redhat.com>
Date:   Thu, 9 Jul 2020 19:25:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <a197f532-7020-0d8e-21bf-42bb66e8daec@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 09/07/20 19:16, Markus Elfring wrote:
>> +	mempool_destroy(virtscsi_cmd_pool);
>> +	virtscsi_cmd_pool = NULL;
>> +	kmem_cache_destroy(virtscsi_cmd_cache);
>> +	virtscsi_cmd_cache = NULL;
>>  	return ret;
>>  }
> 
> How do you think about to add a jump target so that the execution
> of a few statements can be avoided according to a previous
> null pointer check?

The point of the patch is precisely to simplify the code, executing a
couple more instruction is not an issue.

Paolo

