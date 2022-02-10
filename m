Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C38FA4B173F
	for <lists+kernel-janitors@lfdr.de>; Thu, 10 Feb 2022 21:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344421AbiBJUyV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 10 Feb 2022 15:54:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:32874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344381AbiBJUyT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 10 Feb 2022 15:54:19 -0500
X-Greylist: delayed 550 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Feb 2022 12:54:19 PST
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC0610C4
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Feb 2022 12:54:19 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 6BA9820B3AD2
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 5/9] pata_mpc52xx: use GFP_KERNEL
To:     Julia Lawall <Julia.Lawall@inria.fr>
CC:     <kernel-janitors@vger.kernel.org>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20220210204223.104181-1-Julia.Lawall@inria.fr>
 <20220210204223.104181-6-Julia.Lawall@inria.fr>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <02326fc3-07ab-feda-1a32-ef4220fbceff@omp.ru>
Date:   Thu, 10 Feb 2022 23:45:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220210204223.104181-6-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2/10/22 11:42 PM, Julia Lawall wrote:

> Platform_driver probe functions aren't called with locks held
> and thus don't need GFP_ATOMIC. Use GFP_KERNEL instead.
> 
> Problem found with Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

MBR, Sergey
