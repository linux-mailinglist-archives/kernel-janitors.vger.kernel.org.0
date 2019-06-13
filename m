Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC51643CCC
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2019 17:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387857AbfFMPiC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 13 Jun 2019 11:38:02 -0400
Received: from foss.arm.com ([217.140.110.172]:37432 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726283AbfFMKIP (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 Jun 2019 06:08:15 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF4C7367;
        Thu, 13 Jun 2019 03:08:14 -0700 (PDT)
Received: from [10.1.196.93] (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC8C33F73F;
        Thu, 13 Jun 2019 03:09:57 -0700 (PDT)
Subject: Re: [bug report] coresight: etm: Clean up device specific data
To:     dan.carpenter@oracle.com
Cc:     kernel-janitors@vger.kernel.org
References: <20190613065518.GD16334@mwanda>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <fda21251-6ab9-aba6-9358-b2718682d21a@arm.com>
Date:   Thu, 13 Jun 2019 11:08:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190613065518.GD16334@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan

On 13/06/2019 07:55, Dan Carpenter wrote:
> Hello Suzuki K Poulose,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 21d26b905c05: "coresight: etm: Clean up device specific
> data" from May 22, 2019, leads to the following Smatch complaint:
> 
>      ./drivers/hwtracing/coresight/coresight-etm3x.c:460 etm_get_trace_id()
>      warn: variable dereferenced before check 'drvdata' (see line 458)
> 
> ./drivers/hwtracing/coresight/coresight-etm3x.c
>     457		int trace_id = -1;
>     458		struct device *etm_dev = drvdata->csdev->dev.parent;
>                                           ^^^^^^^^^
> New dereference
> 
>     459	
>     460		if (!drvdata)
>                      ^^^^^^^^
> Checked too late.  Delete the check?
> 
>     461			goto out;
>     462	
> 

Thanks for the report. I have sent a patch to fix it.

Cheers
Suzuki
