Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E59D47D2EDC
	for <lists+kernel-janitors@lfdr.de>; Mon, 23 Oct 2023 11:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233097AbjJWJu4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 23 Oct 2023 05:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232994AbjJWJuw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 05:50:52 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id BBACED75;
        Mon, 23 Oct 2023 02:50:49 -0700 (PDT)
Received: from [172.30.11.106] (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 56C0460259F26;
        Mon, 23 Oct 2023 17:50:47 +0800 (CST)
Message-ID: <6a7d1006-0988-77ea-0991-9c7b422d78e1@nfschina.com>
Date:   Mon, 23 Oct 2023 17:50:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] virtio_ring: add an error code check in virtqueue_resize
Content-Language: en-US
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        "Michael S. Tsirkin" <mst@redhat.com>
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
In-Reply-To: <1698040004.5365264-4-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2023/10/23 13:46, Xuan Zhuo wrote:
>>>>>>>> Well, what are the cases where it can happen practically?
>>>>>>> Device error. Such as vp_active_vq()
>>>>>>>
>>>>>>> Thanks.
>>>>>> Hmm interesting. OK. But do callers know to recover?
>>>>> No.
>>>>>
>>>>> So I think WARN + broken is suitable.
>>>>>
>>>>> Thanks.
>>>> Sorry for the late, is the following code okay?
>>>>
>>>> @@ -2739,7 +2739,7 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
>>>>                         void (*recycle)(struct virtqueue *vq, void *buf))
>>>>     {
>>>>            struct vring_virtqueue *vq = to_vvq(_vq);
>>>> -       int err;
>>>> +       int err, err_reset;
>>>>
>>>>            if (num > vq->vq.num_max)
>>>>                    return -E2BIG;
>>>> @@ -2759,7 +2759,15 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
>>>>            else
>>>>                    err = virtqueue_resize_split(_vq, num);
>>>>
>>>> -       return virtqueue_enable_after_reset(_vq);
>>>> +       err_reset = virtqueue_enable_after_reset(_vq);
>>>> +
>>>> +       if (err) {
>>> No err.
>>>
>>> err is not important.
>>> You can remove that.
>> Emm, I'm a little confused that which code should I remove ?
>>
>>
>> like this:
>> 	if (vq->packed_ring)
>> 		virtqueue_resize_packed(_vq, num);
>> 	else
>> 		virtqueue_resize_split(_vq, num);
>>
>> And we should set broken and warn inside virtqueue_enable_after_reset()?

In my opinion, we should return the error code of virtqueue_resize_packed() / virtqueue_resize_split().
But if this err is not important, this patch makes no sense.
Maybe I misunderstand somewhere...
If you think it's worth sending a patch, you can send it :).(I'm not familiar with this code).

Thanks,
Su Hui

