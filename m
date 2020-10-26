Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45DBF2988AE
	for <lists+kernel-janitors@lfdr.de>; Mon, 26 Oct 2020 09:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1770794AbgJZInL (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 26 Oct 2020 04:43:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31123 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1769635AbgJZInK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Oct 2020 04:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603701788;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tdIefJ/S5T1RvOULWYU5XkYeJYKRh3p/OM7cFDJ9io4=;
        b=LbzTV9EXtvkFrUicxxbInpKWOSPgHDwzngLJ+6MqzIKGHFPSDUzrvBxZgNc90DehGIzd9T
        r6dig+ul8ECq0+MpX925DEY47lZK9Yxs1irEIS8UjiCr9RZ7ThrB4XgjIDGePhGLcpBwXj
        Kg/EUAtGAbIfk3GAXizLq/et/omqVSc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-YEuBw6PJOyCRfSemoej7fg-1; Mon, 26 Oct 2020 04:43:04 -0400
X-MC-Unique: YEuBw6PJOyCRfSemoej7fg-1
Received: by mail-wr1-f71.google.com with SMTP id q15so8045653wrw.8
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Oct 2020 01:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tdIefJ/S5T1RvOULWYU5XkYeJYKRh3p/OM7cFDJ9io4=;
        b=qJg6pvK7oDFCfIfpFeNQpPG6g6PGZDZflw4Bnz4k/D9+X/Mkg2j9+fk1GjReg6hQxT
         abiP7B7NAoCIh5eMLexL+Bynty25NQRZKWctX8TCQtOJMHwZTciM+aH6DUmAQHmehleF
         w+8JJfVQ7ejjUmj/sD0/AbEUdliYkNuEWi+mxkstZ0YRpAKbRaiy5DH2w387E/NM711u
         tKWNnXC08+a9rTCPyENwQ1BYHkKJF0rVlxYqytqt2mZiPcTnEa3B//DBpwNdJPbJs6cS
         eiBa+xOMF8qMb/X477/m50BUvursw7DQLYp9oNtg4rvqluc90vVyW5ivg3k8QFlpHPEO
         zioQ==
X-Gm-Message-State: AOAM533J9WP9LA3b8x/RqBVz2hvUkAsfXQsh/mq68mWvu2H1LUHPoKuR
        /gTiGa8AY7eUi7oB0mxhmr2enBAnlem9AjZbGPSJElKrLdTlTKnpQuCdJlZkTI//9VlGVDthQXB
        /yFeLrD1tY6UGThxXGLJEzbz1a6xP
X-Received: by 2002:adf:fd49:: with SMTP id h9mr17312832wrs.115.1603701783548;
        Mon, 26 Oct 2020 01:43:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6qoLrHt7rz+8meQEIZn3c7vEx/gDRaWJUKYdtFkGhU3fruxF70yzU08kRzQLI3t1PCPEXxA==
X-Received: by 2002:adf:fd49:: with SMTP id h9mr17312822wrs.115.1603701783324;
        Mon, 26 Oct 2020 01:43:03 -0700 (PDT)
Received: from steredhat (host-79-17-248-215.retail.telecomitalia.it. [79.17.248.215])
        by smtp.gmail.com with ESMTPSA id k18sm20625387wrx.96.2020.10.26.01.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 01:43:02 -0700 (PDT)
Date:   Mon, 26 Oct 2020 09:43:00 +0100
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     David Laight <David.Laight@aculab.com>
Cc:     Colin King <colin.king@canonical.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] vsock: ratelimit unknown ioctl error message
Message-ID: <20201026084300.5ag24vck3zeb4mcz@steredhat>
References: <20201023122113.35517-1-colin.king@canonical.com>
 <20201023140947.kurglnklaqteovkp@steredhat>
 <e535c07df407444880d8b678bc215d9f@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e535c07df407444880d8b678bc215d9f@AcuMS.aculab.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 23, 2020 at 09:30:59PM +0000, David Laight wrote:
>
>From: Stefano Garzarella
>> Sent: 23 October 2020 15:10
>>
>> On Fri, Oct 23, 2020 at 01:21:13PM +0100, Colin King wrote:
>> >From: Colin Ian King <colin.king@canonical.com>
>> >
>> >When exercising the kernel with stress-ng with some ioctl tests the
>> >"Unknown ioctl" error message is spamming the kernel log at a high
>> >rate. Rate limit this message to reduce the noise.
>> >
>> >Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> >---
>> > net/vmw_vsock/af_vsock.c | 2 +-
>> > 1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> >diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>> >index 9e93bc201cc0..b8feb9223454 100644
>> >--- a/net/vmw_vsock/af_vsock.c
>> >+++ b/net/vmw_vsock/af_vsock.c
>> >@@ -2072,7 +2072,7 @@ static long vsock_dev_do_ioctl(struct file *filp,
>> > 		break;
>> >
>> > 	default:
>> >-		pr_err("Unknown ioctl %d\n", cmd);
>> >+		pr_err_ratelimited("Unknown ioctl %d\n", cmd);
>>
>> Make sense, or maybe can we remove the error message returning only the
>> -EINVAL?
>
>Isn't the canonical error for unknown ioctl codes -ENOTTY?
>

Oh, thanks for pointing that out!

I had not paid attention to the error returned, but looking at it I 
noticed that perhaps the most appropriate would be -ENOIOCTLCMD.
In the ioctl syscall we return -ENOTTY, if the callback returns 
-ENOIOCTLCMD.

What do you think?

Stefano

