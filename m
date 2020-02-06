Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD941546FC
	for <lists+kernel-janitors@lfdr.de>; Thu,  6 Feb 2020 16:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbgBFPD6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 6 Feb 2020 10:03:58 -0500
Received: from mta-out1.inet.fi ([62.71.2.226]:46496 "EHLO julia1.inet.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727443AbgBFPD6 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Feb 2020 10:03:58 -0500
Received: from [192.168.44.164] (84.248.30.195) by julia1.inet.fi (9.0.019.26-1) (authenticated as laujak-3)
        id 5E3B5CC700028567; Thu, 6 Feb 2020 17:03:55 +0200
From:   Lauri Jakku <lauri.jakku@pp.inet.fi>
Subject: Re: [PATCH v6] USB: HID: random timeout failures tackle try.
To:     Dan Carpenter <dan.carpenter@oracle.com>, Lauri Jakku <lja@iki.fi>
Cc:     kernel-janitors@vger.kernel.org
References: <20200205153944.11955-1-lja@iki.fi> <20200205171230.GV1778@kadam>
Message-ID: <0febac0f-6727-3d08-87c8-4d45c761654a@pp.inet.fi>
Date:   Thu, 6 Feb 2020 17:03:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200205171230.GV1778@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

I make small descriptions as you suggested and remove dumb comments

.. this is my first time patching kernel publicly so, I'm not used to

the Proper way, but i'm learning all the time :)


--Lauri Jakku

On 5.2.2020 19.12, Dan Carpenter wrote:
> I never recieved v2-v5 so I can't really comment on those.  If you
> didn't send those to linux-usb then let's just pretend we're still on
> v1 otherwise it's just confusing.
>
> This is not how we send v2 patches.  Put [PATCH v6], that's good.
> Then the normal changelog and the Signed-off-by: then under the ---
> cut off put a small comment.
>
> Signed-off-by: you
> ---
> v6: changed commit message
> v5: fixed error reported by kbuild
> v4: blah blah
>
>
>> +/* Wrapper function to send control messages */
> Don't include obvious comments like this.
>
>> +static int usbhid_control_msg(struct usb_device *dev, unsigned int pipe,
>> +				_u8 request, __u8 requesttype, __u16 value,
>> +				__u16 index, void *data, __u16 size,
>> +				int timeout)
>> +{
>> +	/* calculate timeout per call, to archieve total timeout requested */
> This should be obvious if the variables and functions are named well.
>
> It's weird that we're passing the total timeout and then dividing it
> into littler chunks...  Normally we would know the timeout from the
> spec and then the total would be something like "a timeout of 400ms
> won't annoy users."  (This seems wrong).
>
>
>> +	int call_timeout = USBHID_CONTROL_COMMAND_TIMEOUT_CALC(timeout);
> CALC is a bad name because obviously it's going to calculate something.
>
>> +	int call_count   = USBHID_CONTROL_COMMAND_RETRY_COUNT;
> Just call it "int retry = USBHID_CONTROL_COMMAND_RETRY_COUNT;".  Don't
> do anything fancy with the white space.
>
>> +	int ret;
>> +	int timeout_looping;
>> +
>> +	do {
>> +		ret = usb_control_msg(dev, pipe, request, requesttype,
>> +				value, index, data, size, call_timeout);
> The indenting is wrong.  Use checkpatch.pl --strict
>
>> +
>> +		timeout_looping =	(call_count-- > 0) &&
>> +					(ret == -ETIMEDOUT);
>> +	} while (timeout_looping);
> Delete the "timeout_looping" variable.
>
> 	} while (ret == -ETIMEDOUT && retry-- > 0);
>
> Have you tested with just one retry?
>
> regards,
> dan carpenter
>
-- 
Br,
Lauri J.

