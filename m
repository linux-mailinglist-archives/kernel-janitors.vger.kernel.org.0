Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 571BFCFEC1
	for <lists+kernel-janitors@lfdr.de>; Tue,  8 Oct 2019 18:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729026AbfJHQQE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 8 Oct 2019 12:16:04 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59909 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727514AbfJHQQE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Oct 2019 12:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570551363;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LMCrrylCRmBl2ci0sro7S3+VKpru5MCXIR/yx7hpz7Q=;
        b=OKwdUpgtoSG5330oMojiXPuNfRRMGyEEpD5aqI1gMj67xbemyDtJovPPR2SgF2mIss5iLT
        4CqpXOpdIQU8Gf5ekQghQoc+vw6EbFOuoAwHGCCgI0/VKofrUhc2Ur1kvtGqA/OsBAA+8z
        rhxlCTQCiG2t4+fe5XCRR52KknN94SI=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-mjK-cLLHOmOgL_h-aVNveg-1; Tue, 08 Oct 2019 12:15:56 -0400
Received: by mail-io1-f71.google.com with SMTP id r20so33761642ioh.7
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Oct 2019 09:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=ou0tS7RrxGwJYbkv5P7tqtmWszS5GQLWwcSoY8Uzr/4=;
        b=QUrwodTJmeGakOOny8Fo/olR+AjA6nBN+tPZsbQ5PqRaQQCXdH+XFxQBSWqYpRHC+u
         runE3QgPa6V5pYA3PKzrVBr+92/LRw7rf8jLg67zzB59AeQ6u8yARD3o6Gz4JZlG6Qml
         ApRCUeJ7rC6agGEz1hmpp+9jR3vuwfjR+VxfmclUdkvRGzhvxWUjOTT7FNjIt3yW7vt3
         9fo0sHddWtGk8eP34th4ioAwdRLxga6QE8ZzyyClB+HFP+2rgPUl5pZRmV+FMYx9ih2s
         CNnTiQNTmAETbWXhpzsbLm0ulKUQsKOrF30ChFJDLl7jvcwRMr0z/Vu8aQ6gx6gwrfjc
         tE7A==
X-Gm-Message-State: APjAAAULMRW7Bn0UCrYH98Pg3taQ8wCgx8lfI0NsQzH/J3abdO1vTymJ
        hrnQi2oPQpNINop7vcQfGHdVI01aDWIw8pvGEk2NJgqmTSBYeiryG0/SQagbicaoRbA8YHa1ZnS
        k05ZYn3r3BKJAlhiL8YTLPkgRkurL
X-Received: by 2002:a5d:8ac4:: with SMTP id e4mr5793648iot.185.1570551355578;
        Tue, 08 Oct 2019 09:15:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx0+hoB1v72LiMOycxhZcE17wVcnSgjBHNmFhBxaa0wEB6Fdy7656PMyUlh6rq7awUIB1D8Bg==
X-Received: by 2002:a5d:8ac4:: with SMTP id e4mr5793615iot.185.1570551355314;
        Tue, 08 Oct 2019 09:15:55 -0700 (PDT)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
        by smtp.gmail.com with ESMTPSA id c8sm9338443ile.9.2019.10.08.09.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 09:15:54 -0700 (PDT)
Date:   Tue, 8 Oct 2019 09:15:53 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Colin King <colin.king@canonical.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Ingo Molnar <mingo@kernel.org>, linux-efi@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] efi/tpm: fix sanity check of unsigned tbl_size
 being less than zero
Message-ID: <20191008161553.qls5lbyaxlasw25v@cantor>
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
        Colin King <colin.king@canonical.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Ingo Molnar <mingo@kernel.org>, linux-efi@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191008100153.8499-1-colin.king@canonical.com>
 <20191008114559.GD25098@kadam>
MIME-Version: 1.0
In-Reply-To: <20191008114559.GD25098@kadam>
User-Agent: NeoMutt/20180716
X-MC-Unique: mjK-cLLHOmOgL_h-aVNveg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue Oct 08 19, Dan Carpenter wrote:
>On Tue, Oct 08, 2019 at 11:01:53AM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the check for tbl_size being less than zero is always false
>> because tbl_size is unsigned. Fix this by making it a signed int.
>>
>> Addresses-Coverity: ("Unsigned compared against 0")
>> Fixes: e658c82be556 ("efi/tpm: Only set 'efi_tpm_final_log_size' after s=
uccessful event log parsing")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/firmware/efi/tpm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/efi/tpm.c b/drivers/firmware/efi/tpm.c
>> index 703469c1ab8e..ebd7977653a8 100644
>> --- a/drivers/firmware/efi/tpm.c
>> +++ b/drivers/firmware/efi/tpm.c
>> @@ -40,7 +40,7 @@ int __init efi_tpm_eventlog_init(void)
>>  {
>>  =09struct linux_efi_tpm_eventlog *log_tbl;
>>  =09struct efi_tcg2_final_events_table *final_tbl;
>> -=09unsigned int tbl_size;
>> +=09int tbl_size;
>>  =09int ret =3D 0;
>
>
>Do we need to do a "ret =3D tbl_size;"?  Currently we return success.
>It's a pitty that tpm2_calc_event_log_size() returns a -1 instead of
>-EINVAL.
>
>regards,
>dan carpenter
>

perhaps "ret =3D -EINVAL;"? Currently nothing checks the return value of ef=
i_tpm_eventlog_init though.

