Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 044D7F129A
	for <lists+kernel-janitors@lfdr.de>; Wed,  6 Nov 2019 10:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730620AbfKFJpB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 6 Nov 2019 04:45:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51150 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727363AbfKFJpA (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Nov 2019 04:45:00 -0500
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 9096E8553D
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Nov 2019 09:45:00 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id u2so7690761wrm.7
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Nov 2019 01:45:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q2jUnPlZpq07oDm9GijOu7mC0nL0SjcNzrjjj8E2oWY=;
        b=kUV7WJqW7QneC7UmGI0YGtpVTLP+hPQ1qe6oVWyBSXwgXfl/bgy+Vo1mdfmU0E91k5
         Hd604jvcltljJwdGUfIhIMRB8O7ffF/Rq40aJz0ojoKw+vwKYPBMCPu4aRwGx6YXAc+T
         KILRx0wxdU+HXb4FRiIHPHKB03w6kAM4OQi1+rVLabEJcSnePr9F6nGB3Gn+Dm0gK3hD
         f4V9PfJC5MYv61XVlzQyu5Lf5ke2LMnJv04EZRWf1+JndvFQWU2qEdo3BR8UriCllK8Q
         lPlQ2GcNNDj0Xo8fXtrrA+5tvQj7oCTlNQ2jmjSwhH0ByKQovV0DfJOPB2MupUxRwajw
         M8fA==
X-Gm-Message-State: APjAAAWwPqFq8CEFs+jK9ReSE44KxZvQBSarbKKv1DlAlr2TV5LpBU2y
        L4y8EUGarcU1Ok5HbuFKxA+okI/Mk9n7ptdIVmhioyN7zMdjJZu4SHHtTHBHAGuYsbZdZ0V/bV7
        hRr7IJXg05ed0YbNHW32wMLsHOW9O
X-Received: by 2002:a1c:28d4:: with SMTP id o203mr1586035wmo.147.1573033499179;
        Wed, 06 Nov 2019 01:44:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqzy6ZB2McWXQnxB1WXTjJovdTVeWBiliCnOZxLunZefkUZmU+i0YssuwnYkfHXlbbAwIjGLmg==
X-Received: by 2002:a1c:28d4:: with SMTP id o203mr1586020wmo.147.1573033498912;
        Wed, 06 Nov 2019 01:44:58 -0800 (PST)
Received: from [192.168.10.150] ([93.56.166.5])
        by smtp.gmail.com with ESMTPSA id s21sm33339142wrb.31.2019.11.06.01.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2019 01:44:58 -0800 (PST)
Subject: Re: [PATCH] kvm: Fix NULL dereference doing kvm_create_vm()
To:     Christian Borntraeger <borntraeger@de.ibm.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jim Mattson <jmattson@google.com>
Cc:     =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Junaid Shahid <junaids@google.com>, kvm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Wanpeng Li <wanpengli@tencent.com>
References: <20191106082636.GB31923@mwanda>
 <8f7e33e9-9ae0-4f56-3bb6-b9f3db807d38@de.ibm.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <7eddf725-e034-d65d-3fb1-2babcfaa812d@redhat.com>
Date:   Wed, 6 Nov 2019 10:44:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8f7e33e9-9ae0-4f56-3bb6-b9f3db807d38@de.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 06/11/19 09:30, Christian Borntraeger wrote:
> The same patch was already sent by Wanpeng Li.
> 
> See 
> https://lore.kernel.org/lkml/1572848879-21011-1-git-send-email-wanpengli@tencent.com/

I'm also going to send a somewhat different version today (hopefully).
Stay tuned...

Paolo
