Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 717CA1FF631
	for <lists+kernel-janitors@lfdr.de>; Thu, 18 Jun 2020 17:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730930AbgFRPHn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 18 Jun 2020 11:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbgFRPHn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Jun 2020 11:07:43 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37FCFC06174E
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Jun 2020 08:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=m+OFfJSY4rZKdVoH+w5N0+dEjJsPwsStzddDtn4aW6E=; b=IiQ857N6XbavPmxpulXY13bcSi
        E/3slYAVPIraPbQN4scsZzF9adDs42xqOvfF49rqKGKh9oXNKbpYC0E0IHeFugOeU7niPIoNYS+qB
        rvzxDVWayYlwqr3Y83Wz9f4AJuvOpT3yDCF0CAaHIqaXXcI/+UVr/F6zlrSW1a9ZBxf0h0UJGvCCy
        Cr8gePvcEiTUjJfqZ+UbbyYTEbHrVCoAodH0ARhdRYtrw+wOgA3LaSU22vJrYmzDM3QbVtWBR/R75
        kJP3Fhh39dhhIOhffNSDp71KREeCoOo2xVIdFGkarVMtL0P4nQMftE2pM10fd/0kWl4LaJ6MSBXjk
        EpgluBgw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jlw8k-0006R2-Ti; Thu, 18 Jun 2020 15:07:42 +0000
Subject: Re: [help][coccinelle] coccicheck failed
To:     Giacomo Picchiarelli <gpicchiarelli@gmail.com>,
        kernel-janitors@vger.kernel.org
References: <47cba5b5-0d49-f6e8-09db-557a4c15f285@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a28e6bff-c108-bcaa-78f7-3b525c73e81b@infradead.org>
Date:   Thu, 18 Jun 2020 08:07:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <47cba5b5-0d49-f6e8-09db-557a4c15f285@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 6/18/20 6:23 AM, Giacomo Picchiarelli wrote:
> Newbie here. I couldn't try the patch attached. 
> I'm using coccinelle (spatch version 1.0.4 with Python support and with PCRE support), 
> I'm having issues with the following command:
> 
> make coccicheck MODE=patch
> 
> "./tools/testing/selftests/net/hwtstamp_config.c:74:45-46: WARNING: Use ARRAY_SIZE
> 
> 807 811
> 
> coccicheck failed"
> 
> Applied to: commit 1b5044021070efa3259f3e9548dc35d1eb6aa844 (HEAD -> master, origin/master, origin/HEAD)
> Merge: 69119673bd50 dbed452a078d
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Wed Jun 17 11:29:37 2020 -0700
> 
> Suggestions?


Add "DEBUG_FILE=cocci.err" to the command line. "cocci.err" will contain
more detailed info about the failure, then someone might know what to do
about it.

-- 
~Randy

