Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F06F41470F6
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 Jan 2020 19:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbgAWSl4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 23 Jan 2020 13:41:56 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46644 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbgAWSl4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Jan 2020 13:41:56 -0500
Received: by mail-pf1-f193.google.com with SMTP id n9so1919842pff.13
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Jan 2020 10:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hVVJiVofuq6jqT8tysqA5aMKgAsODtyC1uhbEikyAQ8=;
        b=qrnuqwTbuWLKb92ONC2CXaYTQWIYfF8DxdwKhjeaVXX6GAs7puvD94VO3ij/4IcOsk
         QliauhYOoWF4e4na4cD1Pve2IFiHHDPMc/r9o7NLl9AuTRiu7gJ4AKJYo4OsLW5LRV4F
         1IiT1yR8dcgGaLN4wfGR6Kn4vky0fGbPGMXf9Soc5VsFaWCemq0stfHFjiPn/U5KSQLS
         +wS24wFzJm21kkj+wSckN6tilYc98lc4PfKRh/EXA5g9/Hte1mxFZuaF6rBqGqIUPnpX
         aFnQaE/NxMZna4tB6oAf7PkQ4EVqDvyyj6g9Sa59qLEG+NaXcBS9/cokO/DAU/GA27EH
         Im7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hVVJiVofuq6jqT8tysqA5aMKgAsODtyC1uhbEikyAQ8=;
        b=iFnGrcaPyVzoTXF0v8EttGXlqepztl0zyE55rfrvheOQI2f6hZTM2KfU46lCrxnGeY
         08tnetOI0GjjQCW4lzWyOSMt/NXkZAD4daYt3Zv9t3WcCuy0kYgHJ9PoI7IkgYW+YRXr
         DFgqFMrzfXmep3hqW//1Q5m9o9LJ9M1cikSxnYuKABB7gXlX9EaaNZrr7ymsFQAZoLb3
         7YolW1djtQswf6dVgUAapQDYJY69bhrycgzQFiiu+LQJiUoVIWGDAZIs0wwIjFGMmlao
         l7GmMJ7T9ONsf+cZnWzI2bdfoJYQdFt1sbBBYT1SKMTj/3ztQMWQKj3NGvWuGLf/LUt0
         zbHg==
X-Gm-Message-State: APjAAAVr5kX+r/0cLov+FapKOSs4X27UZdQNAYk+NbUVVukmfQmF6Yr8
        ZAFGkA6MvjoIRw/8ucjEmeYzhA==
X-Google-Smtp-Source: APXvYqxyUlS85/lEfnr4wwXVf6rmaypUzEXpVAItiquKi8D7EUEX0nSWXUwQiG3fuTzpGObtNiSJDQ==
X-Received: by 2002:a63:1210:: with SMTP id h16mr139816pgl.171.1579804915805;
        Thu, 23 Jan 2020 10:41:55 -0800 (PST)
Received: from ?IPv6:2600:380:4562:fb25:b980:6664:b71f:35b5? ([2600:380:4562:fb25:b980:6664:b71f:35b5])
        by smtp.gmail.com with ESMTPSA id s26sm3520454pfe.166.2020.01.23.10.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2020 10:41:55 -0800 (PST)
Subject: Re: [PATCH] partitions/ldm: fix spelling mistake "to" -> "too"
To:     Colin King <colin.king@canonical.com>,
        Richard Russon <ldm@flatcap.org>,
        linux-ntfs-dev@lists.sourceforge.net, linux-block@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200123002921.2832716-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <0d383b8a-b2c5-7669-f989-4239531d3fc0@kernel.dk>
Date:   Thu, 23 Jan 2020 11:41:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200123002921.2832716-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 1/22/20 5:29 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a ldm_error message. Fix it.

Applied, thanks.

-- 
Jens Axboe

