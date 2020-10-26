Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0DB2989ED
	for <lists+kernel-janitors@lfdr.de>; Mon, 26 Oct 2020 11:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1768864AbgJZKCO (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 26 Oct 2020 06:02:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32763 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1768821AbgJZKBV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Oct 2020 06:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603706480;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=g9M52w860PyPvVBSu7mKSxeRwS8lIdF5tDbDT2wR+cs=;
        b=gvajNPWQRuraAmYsfg9XMaP885aCKQ3J3yrNKkyX4QOF9VXJ/7VXBZQXWYWGfDWfCsZVHS
        a6Udonlc2I3omiAYGke69YhcLCNU8ClTSZ7hHJSKinT7Psu3v9sTLQjiObinAFuQtSUGt1
        Mf/rF9v1Hx4OooBCLTM+meU0NntJGhE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-y6ZhrjBTNQqd8UZikdo63g-1; Mon, 26 Oct 2020 06:01:18 -0400
X-MC-Unique: y6ZhrjBTNQqd8UZikdo63g-1
Received: by mail-wr1-f72.google.com with SMTP id t17so8155747wrm.13
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Oct 2020 03:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g9M52w860PyPvVBSu7mKSxeRwS8lIdF5tDbDT2wR+cs=;
        b=QfL8NxLCFwrSLaX9Yrh2ujRCuOMdHo7/7sEf6rNwe+kY5QO2OM9sWmvpnY4eLw90xX
         qV7bYPGyF2LZ4mNmdiXr/buov1Jjf2T15AlQ2ZfuopsTvmWi1Uv8jc9F3kQHJ54RkD3Y
         CDkx7YilCpgeYDaONQpsnh3gIn277CniYrPt8FaTVRcA8mA1vrzb8byb8NWDO9QL7asD
         lfXnWztfzmRGMMLWul/TQ1AgyoDBRq7w4NJAH3BtAcY9gtuHZ/Pr4D6P7EhUJ/DG+iEw
         EjtadzqOLWsSBE3SJQXb4NB/DebX0Dx7aaoG1VxNZIr6JZsLG0mZqfzWaF4is5XnJY4r
         dkYQ==
X-Gm-Message-State: AOAM530IlyAJlvr3MrhbZE8tb813C3lWi0oIbQQpbrBukOhamvOA4fcI
        R7N+qRxRn8yP7liYgNAwuDbYoaTUgai/CfFJnq93PZX731G1igqOI6ILFsANo7xR/olqohSJ94N
        EvZ9g21yC0Z9bGVMbloLXI8VjNXye
X-Received: by 2002:a1c:7214:: with SMTP id n20mr15399259wmc.93.1603706476058;
        Mon, 26 Oct 2020 03:01:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqhquQiOmnt0ldElrGf3ZubNN/KA9VMe3Bjf5dcZx476oa5Meo2vVFpvD5OnEUV2kNEXETSQ==
X-Received: by 2002:a1c:7214:: with SMTP id n20mr15399246wmc.93.1603706475872;
        Mon, 26 Oct 2020 03:01:15 -0700 (PDT)
Received: from steredhat (host-79-17-248-215.retail.telecomitalia.it. [79.17.248.215])
        by smtp.gmail.com with ESMTPSA id t7sm21294559wrx.42.2020.10.26.03.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 03:01:15 -0700 (PDT)
Date:   Mon, 26 Oct 2020 11:01:12 +0100
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     David Laight <David.Laight@aculab.com>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Colin King <colin.king@canonical.com>,
        "David S . Miller" <davem@davemloft.net>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] vsock: ratelimit unknown ioctl error message
Message-ID: <20201026100112.qaorff6c6vucakyg@steredhat>
References: <20201023122113.35517-1-colin.king@canonical.com>
 <20201023140947.kurglnklaqteovkp@steredhat>
 <e535c07df407444880d8b678bc215d9f@AcuMS.aculab.com>
 <20201026084300.5ag24vck3zeb4mcz@steredhat>
 <d893e3251f804cffa797b6eb814944fd@AcuMS.aculab.com>
 <20201026093917.5zgginii65pq6ezd@steredhat>
 <3e34e4121f794355891fd7577c9dfbc0@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <3e34e4121f794355891fd7577c9dfbc0@AcuMS.aculab.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 26, 2020 at 09:46:17AM +0000, David Laight wrote:
>From: Stefano Garzarella
>> Sent: 26 October 2020 09:39
>>
>> On Mon, Oct 26, 2020 at 09:13:23AM +0000, David Laight wrote:
>> >From: Stefano Garzarella
>> >> Sent: 26 October 2020 08:43
>> >...
>> >> >Isn't the canonical error for unknown ioctl codes -ENOTTY?
>> >> >
>> >>
>> >> Oh, thanks for pointing that out!
>> >>
>> >> I had not paid attention to the error returned, but looking at it I
>> >> noticed that perhaps the most appropriate would be -ENOIOCTLCMD.
>> >> In the ioctl syscall we return -ENOTTY, if the callback returns
>> >> -ENOIOCTLCMD.
>> >>
>> >> What do you think?
>> >
>> >It is 729 v 443 in favour of ENOTTY (based on grep).
>>
>> Under net/ it is 6 vs 83 in favour of ENOIOCTLCMD.
>>
>> >
>> >No idea where ENOIOCTLCMD comes from, but ENOTTY probably
>> >goes back to the early 1970s.
>>
>> Me too.
>>
>> >
>> >The fact that the ioctl wrapper converts the value is a good
>> >hint that userspace expects ENOTTY.
>>
>> Agree on that, but since we are not interfacing directly with userspace,
>> I think it is better to return the more specific error (ENOIOCTLCMD).
>
>I bet Linux thought it could use a different error code then
>found that 'unknown ioctl' was spelt ENOTTY.

It could be :-)

Anyway, as you pointed out, I think we should change the -EINVAL with 
-ENOTTY or -ENOIOCTLCMD.

@Jakub what do you suggest?

Thanks,
Stefano

