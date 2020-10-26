Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB0229953A
	for <lists+kernel-janitors@lfdr.de>; Mon, 26 Oct 2020 19:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1789676AbgJZSZK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 26 Oct 2020 14:25:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58282 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1784607AbgJZSZI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Oct 2020 14:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603736706;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PTOPOTQ28R0upPb6yV12OFPjWFChCPsyJnX2G5n47O4=;
        b=LrXhlmnMhktLN/5UM5Irv+HPzuSPaN77ZuR7mVwTkV5tJrbImamKpXfjlXTFh47idFkoAd
        QSjaxPHKSqaAT+AeXH8tuF+lu3APJ9KF2UK365q7Gs/0l6leC0sAOIwmfi4ZQynIlWlUQn
        LrYayDnnppappvMMRZzIKjaax9Wuw58=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-yiKTRubsNM2BlJBfuChupg-1; Mon, 26 Oct 2020 14:25:04 -0400
X-MC-Unique: yiKTRubsNM2BlJBfuChupg-1
Received: by mail-wm1-f70.google.com with SMTP id l16so6142215wmh.1
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Oct 2020 11:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PTOPOTQ28R0upPb6yV12OFPjWFChCPsyJnX2G5n47O4=;
        b=h5xy3WfrsCp9t3UeSpd5JuFnrDwbIA/K2JCGeUJUlWm40kCInvBWx3kof02cP5yv7b
         saMlnHAapcnoptYvAHFp4T0jauNFIaF7MuLPe6PrOMJuUmOCraqDlv9nloNSh6OZfWK5
         JFZE/qWeegEpA9hJ2RFFkadkAa6KW5eUZgFQYWERlBh3e40x5f4zTU2romARWU13AVGY
         Sx8eVdRJLNtnpAv7MvmlQmkPDY1PdWGo2Z8+qwzVhYRN/nCKBPh/fxuaznuODwNQy6hO
         Ei9juwZyoT832The2MvpaiZfxj0zfcphz5788gyF1rkKxS+ZmjMVSASNd4tpSWDDntmQ
         A0MA==
X-Gm-Message-State: AOAM533oIk/fHTYzF0JtX1bpyLeN/Jf8Ez4oMrEgm3kvcX39k94jmZcU
        JQUC7nE2jhwb7SUa5DoxoBynWUtpBy7ixXTlQV5xaA070MXJeaqUIRacgEd0G2Q5/eRAcLK/6yz
        cQa2ku0ufLECzQGcOprquQmkWdGxo
X-Received: by 2002:a1c:cc07:: with SMTP id h7mr18215187wmb.55.1603736700657;
        Mon, 26 Oct 2020 11:25:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkli58w2YGvlcCf87uJq2IZGE8a3ti/dpYthSyydRCGsmb5nUsUwgCQtZdQpS8BkX/Q79nMQ==
X-Received: by 2002:a1c:cc07:: with SMTP id h7mr18215171wmb.55.1603736700414;
        Mon, 26 Oct 2020 11:25:00 -0700 (PDT)
Received: from steredhat (host-79-17-248-215.retail.telecomitalia.it. [79.17.248.215])
        by smtp.gmail.com with ESMTPSA id v6sm23367090wrp.69.2020.10.26.11.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 11:24:59 -0700 (PDT)
Date:   Mon, 26 Oct 2020 19:24:57 +0100
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     Colin King <colin.king@canonical.com>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     David Laight <David.Laight@aculab.com>,
        "David S . Miller" <davem@davemloft.net>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] vsock: ratelimit unknown ioctl error message
Message-ID: <20201026182457.fy6uxrjgs5bpzmnr@steredhat>
References: <20201023122113.35517-1-colin.king@canonical.com>
 <20201023140947.kurglnklaqteovkp@steredhat>
 <e535c07df407444880d8b678bc215d9f@AcuMS.aculab.com>
 <20201026084300.5ag24vck3zeb4mcz@steredhat>
 <d893e3251f804cffa797b6eb814944fd@AcuMS.aculab.com>
 <20201026093917.5zgginii65pq6ezd@steredhat>
 <3e34e4121f794355891fd7577c9dfbc0@AcuMS.aculab.com>
 <20201026100112.qaorff6c6vucakyg@steredhat>
 <20201026105548.0cc911a8@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201026105548.0cc911a8@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 26, 2020 at 10:55:48AM -0700, Jakub Kicinski wrote:
>On Mon, 26 Oct 2020 11:01:12 +0100 Stefano Garzarella wrote:
>> On Mon, Oct 26, 2020 at 09:46:17AM +0000, David Laight wrote:
>> >From: Stefano Garzarella
>> >> Sent: 26 October 2020 09:39
>> >>
>> >> On Mon, Oct 26, 2020 at 09:13:23AM +0000, David Laight wrote:
>> >> >From: Stefano Garzarella
>> >> >> Sent: 26 October 2020 08:43
>> >> >...
>> >> >> >Isn't the canonical error for unknown ioctl codes -ENOTTY?
>> >> >> >
>> >> >>
>> >> >> Oh, thanks for pointing that out!
>> >> >>
>> >> >> I had not paid attention to the error returned, but looking at it I
>> >> >> noticed that perhaps the most appropriate would be -ENOIOCTLCMD.
>> >> >> In the ioctl syscall we return -ENOTTY, if the callback returns
>> >> >> -ENOIOCTLCMD.
>> >> >>
>> >> >> What do you think?
>> >> >
>> >> >It is 729 v 443 in favour of ENOTTY (based on grep).
>> >>
>> >> Under net/ it is 6 vs 83 in favour of ENOIOCTLCMD.
>> >>
>> >> >
>> >> >No idea where ENOIOCTLCMD comes from, but ENOTTY probably
>> >> >goes back to the early 1970s.
>> >>
>> >> Me too.
>> >>
>> >> >
>> >> >The fact that the ioctl wrapper converts the value is a good
>> >> >hint that userspace expects ENOTTY.
>> >>
>> >> Agree on that, but since we are not interfacing directly with userspace,
>> >> I think it is better to return the more specific error (ENOIOCTLCMD).
>> >
>> >I bet Linux thought it could use a different error code then
>> >found that 'unknown ioctl' was spelt ENOTTY.
>>
>> It could be :-)
>>
>> Anyway, as you pointed out, I think we should change the -EINVAL with
>> -ENOTTY or -ENOIOCTLCMD.
>>
>> @Jakub what do you suggest?
>
>ENOIOCTLCMD is a kernel-internal high return code (515) which should
>be returned by the driver, but it's then caught inside the core and
>translated to ENOTTY which is then returned to user space.
>
>So you're both right, I guess? But the driver should use ENOIOCTLCMD.
>

Thanks for clarify!

@Colin, can you send a v2 removing the error message and updating the 
return value?

Thanks,
Stefano

