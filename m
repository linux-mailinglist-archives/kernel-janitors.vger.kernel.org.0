Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 543769FE24
	for <lists+kernel-janitors@lfdr.de>; Wed, 28 Aug 2019 11:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfH1JOo (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 28 Aug 2019 05:14:44 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38788 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbfH1JOn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 28 Aug 2019 05:14:43 -0400
Received: by mail-lf1-f65.google.com with SMTP id c12so1513631lfh.5
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Aug 2019 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W/FAvQVJWH8hNDqsZxVjsvHGWQ4cwiHioyZRXaiwuH4=;
        b=PIAg8LbvLk6D0489+QlpDRqaNqGp/RCZ4+jhKkMhIiBc2/Dd3RlrzlBuLBC/HxydEC
         QowWxlIXSFCcvN/jGvd5Yg34idYzc6aCxnbN9klxRc2JGYBnbpeUz9ypAbTiLWzJQDRT
         iBK3ZNZNyvZkdpdEu8eEdu99LWq66flJeWzenx7xEGLkUp88abcmEZKA6dk+/iar2gLY
         H1vbyG5EMg0ssZr0n/1cAP/1YrdQoleL/mzP+YJhRVJIZOX1DwxNN4fN/b7cb7tU4B8r
         JOis9BEPUMSlTEBN92wV0/IvRHOioQfaupKTQCtVIOfksaLch4G9E2qhx7HKkD9eQG+S
         G+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W/FAvQVJWH8hNDqsZxVjsvHGWQ4cwiHioyZRXaiwuH4=;
        b=BHQmAnM0boA9Ne0v4bK6/hcFVV5f4J0zC24T95yoGg7l3SiuPLtt/vIzZKMuPdqO1p
         7fhJMmLMBoZRSEex7Whq/h/LNxOhWoUmTb0YWPhLbeTfJm8iwp8aCygP9qk29yKYlZaP
         YMOYfzOjSNSG2iJWuNY54sXreRWl0fX53gSxUP6giZ5yY90dX5EG7qABXbZ/UDrIQiuZ
         jHipm6TtK64TXv/bQ7QvUZz5Bg7up7PtTbqD6aMlQi+eyZWB8tImkhpT029FwHSYe96j
         rHOvtFdzuEU5VPthDgZWVo9ZeKjzun9EVOnAoJT0lnmowDyMHRh9hS7UA9w0w5WX4/hR
         PumQ==
X-Gm-Message-State: APjAAAWka7E6oVaB85VwjS4HMqU2+xVQrifXG+n72mecqyNnR9kugYUh
        JrzEIB1mxVMk0acKNihQXIcPUp+IWXs=
X-Google-Smtp-Source: APXvYqyxt6ENbz8kd9XK40+sRsJvEZ4lHaMldtpiGWZ4JbUMbRrBUe5f2u6ARgH7OgzyukMvezH8qQ==
X-Received: by 2002:ac2:43ad:: with SMTP id t13mr2097116lfl.66.1566983681773;
        Wed, 28 Aug 2019 02:14:41 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:43c:79c5:cc63:c37e:a616:212b? ([2a00:1fa0:43c:79c5:cc63:c37e:a616:212b])
        by smtp.gmail.com with ESMTPSA id h15sm498484ljl.64.2019.08.28.02.14.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 02:14:41 -0700 (PDT)
Subject: Re: [PATCH] arcnet: capmode: remove redundant assignment to pointer
 pkt
To:     Colin King <colin.king@canonical.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190827112954.26677-1-colin.king@canonical.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1e784ee7-c049-1155-ab7e-a90f1f20f3dd@cogentembedded.com>
Date:   Wed, 28 Aug 2019 12:14:31 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827112954.26677-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello!

On 27.08.2019 14:29, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer pkt is being initialized with a value that is never read
> and pkg is being re-assigned a little later on. The assignment is
       ^^^ pkt

> redundant and hence can be removed.
> 
> Addresses-Coverity: ("Ununsed value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
[...]

MBR, Sergei
