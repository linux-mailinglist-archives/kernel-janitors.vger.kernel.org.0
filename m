Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18FA1153605
	for <lists+kernel-janitors@lfdr.de>; Wed,  5 Feb 2020 18:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgBERMp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 5 Feb 2020 12:12:45 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:42642 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgBERMo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 5 Feb 2020 12:12:44 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 015H8g19104907;
        Wed, 5 Feb 2020 17:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ziwhBfJxsYkUa+0mSTF33rekI68awnjLAEV5+KGHLCY=;
 b=ND81bfTq/GF4ljFXH9RwdKTDJtySfewfKemjZGjUMcss2hdf9td5dAaq8Y7/qIOmWjk4
 pzV2v099LTIyOhKmH1TINHea/R0nH3tWb6uM7sA9UNWRDpqpIqe27sRiz8t1S0Pnm9Fo
 HMvfBh9+OavidgMoP2ZN5+hm9U9v8JddYthRJPotNfKc6Pq834CpIfnXSWLynSlpC4Xl
 8bJ07iUPlhFr2Ie6vzqmslwIrN6Lp4yf6bO5+y9HDzw7K+CPJYBr7VuvzpLz9kmqG16v
 bWeyphQRyhfBDuX5nuX7VKwGTGbarQQVYAr3J8YUVdgp1qpuODDZgezNnZmxz1xhFyJ7 mg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=ziwhBfJxsYkUa+0mSTF33rekI68awnjLAEV5+KGHLCY=;
 b=rKScMxSDV9CZJdWUhn32Zt3TWCfh8ZAQEs3IpzJeA6Bj+dBEv/3/pkrvGQbj3xIf0/rU
 G5Yn3awMLmp23gCoGXw/gg2XqOJKP9iH0PxXdpj4L5UPlA2FbNUEyeXeH9ki9FhAq314
 hqXR4IsUlNiboHVgOeH8vdKgGOzXbcBGxLXBH0C0JnOHuz8DgmOq9ABaX5jAcV68OrD8
 Uao+LYWgzpE5hur5U4Ldo2/hhNu5gWGg3/R3407kPgVAEfbV0YlS2vCggth4Hj46UV9U
 rjy2RPBsXfb4krx1GY0aDW45pZP3ZVbmqpLROvaHUk8//SDuZ/rBcRvETMX+46q6pKKZ +w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2xykbpce8p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 05 Feb 2020 17:12:39 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 015H90Sm086537;
        Wed, 5 Feb 2020 17:12:38 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 2xykbsb4nd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 05 Feb 2020 17:12:38 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 015HCbiC009013;
        Wed, 5 Feb 2020 17:12:37 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 05 Feb 2020 09:12:36 -0800
Date:   Wed, 5 Feb 2020 20:12:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Lauri Jakku <lja@iki.fi>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v6] USB: HID: random timeout failures tackle try.
Message-ID: <20200205171230.GV1778@kadam>
References: <20200205153944.11955-1-lja@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205153944.11955-1-lja@iki.fi>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9522 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002050131
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9522 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002050131
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

I never recieved v2-v5 so I can't really comment on those.  If you
didn't send those to linux-usb then let's just pretend we're still on
v1 otherwise it's just confusing.

This is not how we send v2 patches.  Put [PATCH v6], that's good.
Then the normal changelog and the Signed-off-by: then under the ---
cut off put a small comment.

Signed-off-by: you
---
v6: changed commit message
v5: fixed error reported by kbuild
v4: blah blah


> +/* Wrapper function to send control messages */

Don't include obvious comments like this.

> +static int usbhid_control_msg(struct usb_device *dev, unsigned int pipe,
> +				_u8 request, __u8 requesttype, __u16 value,
> +				__u16 index, void *data, __u16 size,
> +				int timeout)
> +{
> +	/* calculate timeout per call, to archieve total timeout requested */

This should be obvious if the variables and functions are named well.

It's weird that we're passing the total timeout and then dividing it
into littler chunks...  Normally we would know the timeout from the
spec and then the total would be something like "a timeout of 400ms
won't annoy users."  (This seems wrong).


> +	int call_timeout = USBHID_CONTROL_COMMAND_TIMEOUT_CALC(timeout);

CALC is a bad name because obviously it's going to calculate something.

> +	int call_count   = USBHID_CONTROL_COMMAND_RETRY_COUNT;

Just call it "int retry = USBHID_CONTROL_COMMAND_RETRY_COUNT;".  Don't
do anything fancy with the white space.

> +	int ret;
> +	int timeout_looping;
> +
> +	do {
> +		ret = usb_control_msg(dev, pipe, request, requesttype,
> +				value, index, data, size, call_timeout);

The indenting is wrong.  Use checkpatch.pl --strict

> +
> +		timeout_looping =	(call_count-- > 0) &&
> +					(ret == -ETIMEDOUT);
> +	} while (timeout_looping);

Delete the "timeout_looping" variable.

	} while (ret == -ETIMEDOUT && retry-- > 0);

Have you tested with just one retry?

regards,
dan carpenter

