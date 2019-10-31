Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5405CEB640
	for <lists+kernel-janitors@lfdr.de>; Thu, 31 Oct 2019 18:39:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbfJaRjC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 31 Oct 2019 13:39:02 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36318 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729059AbfJaRjC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 31 Oct 2019 13:39:02 -0400
Received: by mail-io1-f67.google.com with SMTP id s3so3844843ioe.3
        for <kernel-janitors@vger.kernel.org>; Thu, 31 Oct 2019 10:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7F7GIco+RAiSZMoAOBzaWPqe/Yne7EeIQyiFSkYuy08=;
        b=kZwL4hpQFDm4ME4xJiTcQIBTQqxEm5gDHWg/YHRNl2bxzsSfD3T+MHbO4F6W+iuqkv
         QFB8h1HUUSCcX1ZiM4TmvzUHDhF7XpjrAce9ZC5+/XNMmVVZ+gaMUC8CJyzi5eOfmbCL
         Y3XIPkt4OIEGuVaE32wwhSE3WSDWbdwuQIcyRLOeDQtTlp7p5FzjwxzMT/sJC1tGNT5d
         xCtv2tRMswgarBhova/acEgnl3pivcx/8EBxpmvGsH9AnprrF62PyyRbMkhTYzh5SMSZ
         dJCe0dzCvLp12a9j1g7leZEnJKyFJXHR9wLcuitgnC+qYcCTNinmOXEl1n5+HwYJcPUZ
         Nq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7F7GIco+RAiSZMoAOBzaWPqe/Yne7EeIQyiFSkYuy08=;
        b=YizCrhSxAa7vJ7fdUX/PsQ/NesVnJCTXU3OkmDT5wMqc6NoRrhc4Oe2GNDPOWxMtFr
         lwVjhuJRhinKU52xVeZxds/rlt96H6OQPl05cGY4hnE5N80HUCelNcdasFKYw09uMOkA
         SctDvzCtLmiQkQmC06bn9obwMN/Yf5HwT1ZRun9qqQRqfGdfFUq8aLDqAlruR8mDScMc
         JqFpyblivAEEhOqbk+jk9oSzxxRNtpsNtyn9D5wFk9Y0z2stQ+CZcL661WJ8cnRvBi64
         xIBXsWkpxh0X46q7ss9NIWMpzuahaiPD7SxWLXSO04cvOCSO6dDNWSas0Wc/znEvHNwb
         5fAw==
X-Gm-Message-State: APjAAAUXdLDaVfacSk5l0zUvk9Jh3IcMZMOyPMHC0bMNVDEYIWwWlozJ
        0azYXI+nAON902fV45NvpS5rqaUaNV3ETA==
X-Google-Smtp-Source: APXvYqwnYzdGAm/xmPNC+zRrjWOT2IM9/nE8WqYcwOX7iRZc4ALvVWc8R9BiUDk1PMQO65jYHe/NRw==
X-Received: by 2002:a6b:fa08:: with SMTP id p8mr6279327ioh.84.1572543540403;
        Thu, 31 Oct 2019 10:39:00 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id k7sm389299ioq.50.2019.10.31.10.38.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 10:38:59 -0700 (PDT)
Subject: Re: [PATCH] iocost: don't nest spin_lock_irq in ioc_weight_write()
To:     Dan Carpenter <dan.carpenter@oracle.com>, Tejun Heo <tj@kernel.org>
Cc:     linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20191031105341.GA26612@mwanda>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <5507a74c-35e6-177c-d9b1-91ebc3120ea2@kernel.dk>
Date:   Thu, 31 Oct 2019 11:38:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191031105341.GA26612@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/31/19 4:53 AM, Dan Carpenter wrote:
> This code causes a static analysis warning:
> 
>      block/blk-iocost.c:2113 ioc_weight_write() error: double lock 'irq'
> 
> We disable IRQs in blkg_conf_prep() and re-enable them in
> blkg_conf_finish().  IRQ disable/enable should not be nested because
> that means the IRQs will be enabled at the first unlock instead of the
> second one.

Applied for 5.3, thanks.

-- 
Jens Axboe

