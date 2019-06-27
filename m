Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87AC55802E
	for <lists+kernel-janitors@lfdr.de>; Thu, 27 Jun 2019 12:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbfF0K0N (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 27 Jun 2019 06:26:13 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:4417 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726187AbfF0K0M (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jun 2019 06:26:12 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id 148F720158;
        Thu, 27 Jun 2019 12:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1561631167; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=b7yT7/vGM6GOO1DwWUbUPxy6VCKZDOyEV8ndXeD6uHs=;
        b=D/V7szQEEdkZlTTMGemsQ9/qeoldv0Wp5lki1uje++ish6GvrCtlM4tECq5OdzhtRq2yFL
        YE/V2NrBb8CcKb1oKy3w27mAm/wA0HXZLdovygUPRp7g0ipEWxONqkgwPR4/XWHZcgfNFP
        9FbLKu0W84XtPXlCiFgmnezV2Jt/D2qGUx1s5v1J2gZgNl/9a3SCY2YXR4YBvplRO9WZ4f
        p3Hufp3bNWofFB5dkBsusNLljRJerFzgu+GK1GHANDbb2yfECK9xi8YqfVu/D5ioZKSBNN
        qZ4q6roAlM4Li8jmuvP7zi+LRoF42R6eKcY+YuvTStxNglx4Z2km9V7aaIulnA==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id D914EBEEBD;
        Thu, 27 Jun 2019 12:26:06 +0200 (CEST)
Message-ID: <5D1499BE.9090701@bfs.de>
Date:   Thu, 27 Jun 2019 12:26:06 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
CC:     Dan Carpenter <dan.carpenter@oracle.com>,
        kernel-janitors@vger.kernel.org
Subject: Re: [bug report] lib/vdso: Provide generic VDSO implementation
References: <20190627071521.GA22903@mwanda> <c23609d4-2aff-bc5e-afdf-53a4824a2ef7@arm.com> <20190627090734.GD5715@kadam> <0d9880ff-b4a4-c0a2-f22a-a72bbc0ab754@arm.com>
In-Reply-To: <0d9880ff-b4a4-c0a2-f22a-a72bbc0ab754@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.10
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
         ARC_NA(0.00)[];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         BAYES_HAM(-3.00)[100.00%];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[3];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.999,0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_TLS_ALL(0.00)[]
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



Am 27.06.2019 11:09, schrieb Vincenzo Frascino:
> Hi Dan,
> 
> On 6/27/19 10:07 AM, Dan Carpenter wrote:
>> On Thu, Jun 27, 2019 at 09:58:18AM +0100, Vincenzo Frascino wrote:
>>>>    119	fallback:
>>>>    120		return clock_gettime_fallback(clock, (struct __kernel_timespec *)res);
>>>>                                                                                  ^^^
>>>> On x86 this "res" always gets dereferenced.
>>>>
>>>>    121	}
>>>>
>>>
>>> I am not sure I understand the details of this bug report. As far as I can see
>>> "res" is never dereferenced in the vDSO library in this case, but it is passed
>>> to the system call unchanged.
>>>
>>
>> Oh yeah.  Sorry.  My bad.  False positive.  clock_gettime_fallback()
>> doesn't necessarily dereference "res".
>>
> 
> No problem, better a false positive than an ignored negative :-)
> 

maybe it would be clever to add a comment here indicating that this
is intended and no problem ?

re,
 wh
