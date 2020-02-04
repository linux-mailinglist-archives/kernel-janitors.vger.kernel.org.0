Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0723151633
	for <lists+kernel-janitors@lfdr.de>; Tue,  4 Feb 2020 08:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgBDHAx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 4 Feb 2020 02:00:53 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36729 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgBDHAw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 4 Feb 2020 02:00:52 -0500
Received: by mail-lj1-f193.google.com with SMTP id r19so17353610ljg.3
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Feb 2020 23:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Fw3Fp97DeNYp+2+xa4Fjz55Ll2WusA+7c0zUjSyy4EY=;
        b=GNAzZ9znSz8ug8JqCGw3PrDkwsu/TtYhjIMbBkC1b21qTzOSyaDCAkI+me9u2+Nvms
         8BepciHqL1JlyxH49xwy5vWy4ekkrqP4zY+2MRgghS1Sk4hYHmlu1rCJ2xFKurB3hu3b
         ZD/gWD5UVMDFgZWnO0YDWapFSN5454hQi0hrtiLjJ9FfVjL9u03LXOOtuKvte98np4yR
         DDrUisBIeLIt8a1Gqx8VS7slwv2wgBR00uxIYD4r026NZnz39D59YTxcAlfvsFXaEH5Q
         3PTXRXWXVRoOy1QSZWzg8kcJ9Up/jOF432SKZ0cw08zZ0KWVkTicvtEs59YgCG20z39Y
         YGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Fw3Fp97DeNYp+2+xa4Fjz55Ll2WusA+7c0zUjSyy4EY=;
        b=YS+x1OOOf2ufGsia4eIuwQ1R7M6voPSj13IrTSBeAJHMZ0yxfeWYUkmFS78zSsMDuw
         K03U7Br5DxrViFW3jSfH7cYAb0vDbGfU2OlNXV233xQnd3pQWeZXVwF9nGqjh4YQENk1
         h+okCVtUysb8mJknoRUVUejP+/hzrLq6DNYDPqEgowqi2oVHNlDsFZmRJcqN9+dGj8xR
         Kirlvk3vNdiBfm26byqgWSoGpHqmTeFm0G2b4GUl+LysB/L2FoMsri5769bYVLPfMb0z
         +i/xoa5wuUQ7owYujIcNAHG2F++P90Ab9bsTd5uNlvPLvX5Ri02eElD8kNraDn63CZd1
         3UOQ==
X-Gm-Message-State: APjAAAWBhwDyZdYeqscf4x28bW0pGbDiEh0jb2C1Gh7oRJ4Q/v5sBas4
        vCQSnB+Wgm5vpBnqQkTAXZ8rG6oX8C/5zg==
X-Google-Smtp-Source: APXvYqzGH0khFCJGfI+T2Us8FldfXXC5duTXGkBcAsdsJdsCLsXzJux2KU8KQn6Zea2EJg9jb7sxAA==
X-Received: by 2002:a2e:5056:: with SMTP id v22mr16329088ljd.164.1580799648569;
        Mon, 03 Feb 2020 23:00:48 -0800 (PST)
Received: from ?IPv6:2001:2003:f41e:c300:224:1dff:fe12:e61a? ([2001:2003:f41e:c300:224:1dff:fe12:e61a])
        by smtp.gmail.com with ESMTPSA id e20sm10835536ljl.59.2020.02.03.23.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 23:00:47 -0800 (PST)
Subject: Re: [PATCH] USB: HID: Fix timeout by adding retry loop
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
References: <d15b7fa7-596c-96f8-dd07-7831a9fa2f0e@gmail.com>
 <20200204062749.GP1778@kadam>
From:   Lauri Jakku <ljakku77@gmail.com>
Message-ID: <51d8ee09-7cd6-5304-00b0-99276e67aec1@gmail.com>
Date:   Tue, 4 Feb 2020 09:00:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200204062749.GP1778@kadam>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

I'm quite newbie publicly patching stuff, but at anyway:

On 4.2.2020 8.27, Dan Carpenter wrote:
> Hi Lauri,
>
> There are a bunch of issues with this patch.
>
> 1)  There is no way we're going to add a retry loop to
>     usb_control_msg().  We might add it to a driver, but probably we
>     would suspect that the hardware is bad.  Maybe the cable is faulty?
>     Or I could be wrong on that...

For example there is lot of USB HID related oddities reported

by multiple users, that have said that after (kernel) update

of their system USB devices stopped working or work randomly.


I have problem with my mouse, and the problem went away

with my patch. I think that the change to driver by driver is

just code duplication, and with my patch the 'good' HW still

is not going to sleep even that 20ms, the time that I tought

to be good. Max retry time is 400ms.


>
> 2)  You would need to send this to a different list.  Use
>     ./scripts/get_maintainer.pl to find out who.  The
>     linux-usb@vger.kernel.org is the main USB list.

I'm just beginner,  but the MAINTAINERS list mentiones

linus-usb mailing list.

> 3)  The patch doesn't apply.  Read the first paragraph of
>     Documentation/process/email-clients.rst
Ok, will do just that.
> 4) The subject needs to be formatted slightly differently.
>     [PATCH] USB: HID: Fix timeout by adding retry loop
Ok, modified subject as requested.
> 5) The commit message should be more clear what was affected.  Don't
>    start the commit message in the middle of a sentence.

I try to elaborate bit more.

> regards,
> dan carpenter
>
>
Thank you for commit review. I start to fix patch as you suggested.


Br,

Lauri J.

