Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A141AE00C
	for <lists+kernel-janitors@lfdr.de>; Fri, 17 Apr 2020 16:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgDQOjm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 17 Apr 2020 10:39:42 -0400
Received: from ciao.gmane.io ([159.69.161.202]:58672 "EHLO ciao.gmane.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbgDQOjm (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 17 Apr 2020 10:39:42 -0400
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glkj-kernel-janitors-2@m.gmane-mx.org>)
        id 1jPS9a-000Lbn-9w
        for kernel-janitors@vger.kernel.org; Fri, 17 Apr 2020 16:39:38 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     kernel-janitors@vger.kernel.org
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] RDMA/ocrdma: Fix an off-by-one issue in 'ocrdma_add_stat'
Date:   Fri, 17 Apr 2020 16:39:31 +0200
Message-ID: <5c828086-e503-3f91-0589-9899c30c406e@wanadoo.fr>
References: <20200328073040.24429-1-christophe.jaillet@wanadoo.fr>
 <20200414183441.GA28870@ziepe.ca>
 <8c17ed4f-fb29-4ff8-35db-afab284c6e71@wanadoo.fr>
 <20200417135001.GE26002@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200417135001.GE26002@ziepe.ca>
Content-Language: en-US
Cc:     linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 17/04/2020 à 15:50, Jason Gunthorpe a écrit :
> On Fri, Apr 17, 2020 at 03:28:21PM +0200, Marion & Christophe JAILLET wrote:
>> Le 14/04/2020 à 20:34, Jason Gunthorpe a écrit :
>>> On Sat, Mar 28, 2020 at 08:30:40AM +0100, Christophe JAILLET wrote:
>>>> There is an off-by-one issue when checking if there is enough space in the
>>>> output buffer, because we must keep some place for a final '\0'.
>>>>
>>>> While at it:
>>>>      - Use 'scnprintf' instead of 'snprintf' in order to avoid a superfluous
>>>>       'strlen'
>>>>      - avoid some useless initializations
>>>>      - avoida hard coded buffer size that can be computed at built time.
>>>>
>>>> Fixes: a51f06e1679e ("RDMA/ocrdma: Query controller information")
>>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>>> The '\0' comes from memset(..., 0, ...) in all callers.
>>>> This could be also avoided if needed.
>>>>    drivers/infiniband/hw/ocrdma/ocrdma_stats.c | 9 ++++-----
>>>>    1 file changed, 4 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_stats.c b/drivers/infiniband/hw/ocrdma/ocrdma_stats.c
>>>> index 5f831e3bdbad..614a449e6b87 100644
>>>> +++ b/drivers/infiniband/hw/ocrdma/ocrdma_stats.c
>>>> @@ -49,13 +49,12 @@ static struct dentry *ocrdma_dbgfs_dir;
>>>>    static int ocrdma_add_stat(char *start, char *pcur,
>>>>    				char *name, u64 count)
>>>>    {
>>>> -	char buff[128] = {0};
>>>> -	int cpy_len = 0;
>>>> +	char buff[128];
>>>> +	int cpy_len;
>>>> -	snprintf(buff, 128, "%s: %llu\n", name, count);
>>>> -	cpy_len = strlen(buff);
>>>> +	cpy_len = scnprintf(buff, sizeof(buff), "%s: %llu\n", name, count);
>>>> -	if (pcur + cpy_len > start + OCRDMA_MAX_DBGFS_MEM) {
>>>> +	if (pcur + cpy_len >= start + OCRDMA_MAX_DBGFS_MEM) {
>>>>    		pr_err("%s: No space in stats buff\n", __func__);
>>>>    		return 0;
>>>>    	}
>>> The memcpy is still kind of silly right? What about this:
>>>
>>> static int ocrdma_add_stat(char *start, char *pcur, char *name, u64 count)
>>> {
>>> 	size_t len = (start + OCRDMA_MAX_DBGFS_MEM) - pcur;
>>> 	int cpy_len;
>>>
>>> 	cpy_len = snprintf(pcur, len, "%s: %llu\n", name, count);
>>> 	if (cpy_len >= len || cpy_len < 0) {
>>> 		pr_err("%s: No space in stats buff\n", __func__);
>>> 		return 0;
>>> 	}
>>> 	return cpy_len;
>>> }
>>>
>>> Jason
>> It can looks useless, but I think that the goal was to make sure that we
>> would not display truncated data. Each line is either complete or absent.
> So it needsa *pcur = 0 in the error path?
>
> Jason
>
I guess it would keep the existing behavior, should it be needed.

I leave maintainers to choose what looks more readable to them, or just 
to ignore the patch if they think it is useless.
Feel free to propose your version as a patch.

Anyway, thanks for sharing alternative solutions.

CJ


