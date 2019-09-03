Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFA4A630A
	for <lists+kernel-janitors@lfdr.de>; Tue,  3 Sep 2019 09:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbfICHsz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 3 Sep 2019 03:48:55 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:44200 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726740AbfICHsz (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Sep 2019 03:48:55 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 1F225A00C5412BCCE3C0
        for <kernel-janitors@vger.kernel.org>; Tue,  3 Sep 2019 15:48:53 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Sep 2019
 15:48:48 +0800
Subject: Re: [PATCH -next] scsi: smartpqi: remove set but not used variable
 'ctrl_info'
To:     <wharms@bfs.de>
References: <20190831130348.20552-1-yuehaibing@huawei.com>
 <5D6BC1D3.7040605@bfs.de>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <56925735-5fff-9de3-e5db-db088e830461@huawei.com>
Date:   Tue, 3 Sep 2019 15:48:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <5D6BC1D3.7040605@bfs.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2019/9/1 21:04, walter harms wrote:
> 
> 
> Am 31.08.2019 15:03, schrieb YueHaibing:
>> Fixes gcc '-Wunused-but-set-variable' warning:
>>
>> drivers/scsi/smartpqi/smartpqi_init.c: In function 'pqi_driver_version_show':
>> drivers/scsi/smartpqi/smartpqi_init.c:6164:24: warning:
>>  variable 'ctrl_info' set but not used [-Wunused-but-set-variable]
>>
>> commit 6d90615f1346 ("scsi: smartpqi: add sysfs entries") add it but never
>> use, so remove it also variable 'shost'
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  drivers/scsi/smartpqi/smartpqi_init.c | 6 ------
>>  1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
>> index ea5409bebf57..b9e7dabee1e5 100644
>> --- a/drivers/scsi/smartpqi/smartpqi_init.c
>> +++ b/drivers/scsi/smartpqi/smartpqi_init.c
>> @@ -6160,12 +6160,6 @@ static ssize_t pqi_firmware_version_show(struct device *dev,
>>  static ssize_t pqi_driver_version_show(struct device *dev,
>>  	struct device_attribute *attr, char *buffer)
>>  {
>> -	struct Scsi_Host *shost;
>> -	struct pqi_ctrl_info *ctrl_info;
>> -
>> -	shost = class_to_shost(dev);
>> -	ctrl_info = shost_to_hba(shost);
>> -
>>  	return snprintf(buffer, PAGE_SIZE,
>>  		"%s\n", DRIVER_VERSION BUILD_TIMESTAMP);
>>  }
>>
> 
> so, only snprintf() is left. That begs an other question:
> Is that function need at all or can it be replaced with snprintf() ?

No, pqi_driver_version_show is used as below:

static DEVICE_ATTR(driver_version, 0444, pqi_driver_version_show, NULL);

so seems it cannot be removed.

> 
> re,
>  wh
> 
> 
> 

