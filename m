Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8AF724C352
	for <lists+kernel-janitors@lfdr.de>; Thu, 20 Aug 2020 18:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729795AbgHTQ2f (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 20 Aug 2020 12:28:35 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:49086 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727780AbgHTQ2b (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Aug 2020 12:28:31 -0400
Received: from [192.168.42.210] ([93.22.135.164])
        by mwinf5d72 with ME
        id HsUS2300B3YzEb903sUSQW; Thu, 20 Aug 2020 18:28:29 +0200
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 20 Aug 2020 18:28:29 +0200
X-ME-IP: 93.22.135.164
Subject: Re: [PATCH] epic100: switch from 'pci_' to 'dma_' API
To:     David Miller <davem@davemloft.net>
Cc:     kuba@kernel.org, snelson@pensando.io, mhabets@solarflare.com,
        vaibhavgupta40@gmail.com, mst@redhat.com, mkubecek@suse.cz,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20200806201935.733641-1-christophe.jaillet@wanadoo.fr>
 <20200806.142311.94169513118353100.davem@davemloft.net>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <9b8ad131-3c2e-37b7-392c-79fab1a2f2bb@wanadoo.fr>
Date:   Thu, 20 Aug 2020 18:28:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200806.142311.94169513118353100.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 06/08/2020 à 23:23, David Miller a écrit :
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Date: Thu,  6 Aug 2020 22:19:35 +0200
> 
>> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> Christophe, the net-next tree is closed so I'd like to ask that you
> defer submitting these conversion patches until the net-next
> tree opens back up again.
> 
> Thank you.
> 
> 

Hi,
should I resend the few conversion patches sent at the wrong time or are 
they stored somewhere, and will be processed when some time is available 
for it?

CJ
