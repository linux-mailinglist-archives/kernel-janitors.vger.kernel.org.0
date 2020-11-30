Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD2D2C8C8D
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Nov 2020 19:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbgK3ST4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 30 Nov 2020 13:19:56 -0500
Received: from static.214.254.202.116.clients.your-server.de ([116.202.254.214]:34216
        "EHLO ciao.gmane.io" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbgK3ST4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 30 Nov 2020 13:19:56 -0500
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glkj-kernel-janitors-2@m.gmane-mx.org>)
        id 1kjnla-0006iG-4m
        for kernel-janitors@vger.kernel.org; Mon, 30 Nov 2020 19:19:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To:     kernel-janitors@vger.kernel.org
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] mlxsw: switch from 'pci_' to 'dma_' API
Date:   Mon, 30 Nov 2020 19:19:09 +0100
Message-ID: <35052891-4d32-19f0-e991-2aad009917e9@wanadoo.fr>
References: <20201129211733.2913-1-christophe.jaillet@wanadoo.fr>
 <a4fde87f-ea73-8ba4-e6cd-689f0f649eb4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <a4fde87f-ea73-8ba4-e6cd-689f0f649eb4@gmail.com>
Content-Language: en-US
Cc:     linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 29/11/2020 à 22:46, Heiner Kallweit a écrit :
> Am 29.11.2020 um 22:17 schrieb Christophe JAILLET:
>> @@ -1817,17 +1817,17 @@ static int mlxsw_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   		goto err_pci_request_regions;
>>   	}
>>   
>> -	err = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
>> +	err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
> 
> Using dma_set_mask_and_coherent() would be better here.
> 
>>   	if (!err) {
>> -		err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
>> +		err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(64));
>>   		if (err) {
> 
> This check isn't needed, see comment at definition of
> dma_set_mask_and_coherent().
> 

Hi,

Correct, but I didn't want to mix several things in the same commit.
This one is dedicated to automatically generated changes done with 
coccinelle.

I plan to have another set of such clean-ups once "wrappers in 
include/linux/pci-dma-compat.h are gone"

However, if it is prefered to have only one patch, I can resubmit.

CJ


