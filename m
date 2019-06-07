Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A80C938BFC
	for <lists+kernel-janitors@lfdr.de>; Fri,  7 Jun 2019 15:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbfFGNyF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 7 Jun 2019 09:54:05 -0400
Received: from mail-pl1-f178.google.com ([209.85.214.178]:39503 "EHLO
        mail-pl1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727915AbfFGNyF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jun 2019 09:54:05 -0400
Received: by mail-pl1-f178.google.com with SMTP id g9so865362plm.6
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Jun 2019 06:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UIV+DVTBZkk6g50ZvgQ2i5tPWbtivRLjXH9X60peB0w=;
        b=pGisCKy4vcdpuuFq5mWQ0J8ELUsYz3OjiZTmCZRwcGnqBkWANLIdqAddK53p8SBYyz
         3lov7XDwcu1vR5g+kXYWDTax9K5jrvcYXk7r6bO+Lnq+2/DMLzxvBjkfDG6DFsGrC2qD
         DCryvsU9Er715M6wk461rKDZXGczm9Ialm2JBhV3VaJQlA6QXzq1ZV9FL8XCpW49SF+S
         QOTc2WhgCnw1XWT8lOdGrh++af7t1uyNfQqmxGktWrP0vWoT6ECpU6ZJYg0KTTz1N6DB
         twYW76Q/hhcLe3ltPXIYUaVlYtAq+PcQTG6GsMIPf88Wz6pjpChH/mZS8d31Za/Ur7v8
         Jnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UIV+DVTBZkk6g50ZvgQ2i5tPWbtivRLjXH9X60peB0w=;
        b=V30Tzhi+EqycIvHr1LGyhVcFZzVtBzB6wilOi6CkCJiBKBTnSfUIei8g9Eqltlpb0n
         CSqo1oLzDADMiAK2Ks6iAmDhIa4jHGkTQEZ9vs84M8ioU7wrOkWfV4/tMoS5XNrlHg/6
         mBRMT/UG4DyGdv8h6fVp4Kl/m7TVHooXclKvDVUpvPXgsOH/A/HheOINAwR7iLfWUXPT
         +uTEDXDgmb/sg2AYdXyf22z856VVhU1V9j1InB4oKX8+z8kcyurvcxacfY8cE0acHdt6
         7YaLpaVUMoq2XtjX0F+7O9E7F87TUPQvJA/Cn2MWK4se4IGNE2hua4rdadEoUb0t8LVg
         y8/g==
X-Gm-Message-State: APjAAAUPdqPMAQJIhEg1cORRVI4uGGm8nRfr/0BT3eH/RroTE/lxdQpq
        f+VjjRIzFAKTOSetSNuxAjtwmLT8jTw=
X-Google-Smtp-Source: APXvYqxKh/YYQhDa7XfooUjHBzR94MyHs0CkE5KrBk2WKgqYG58CuyJ8bwNKQ0g5jABRHSLqBlcgbg==
X-Received: by 2002:a17:902:830b:: with SMTP id bd11mr4280983plb.202.1559915644197;
        Fri, 07 Jun 2019 06:54:04 -0700 (PDT)
Received: from [172.27.227.216] ([216.129.126.118])
        by smtp.googlemail.com with ESMTPSA id y1sm2420386pfe.19.2019.06.07.06.54.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 06:54:03 -0700 (PDT)
Subject: Re: [bug report] ipv4: Plumb support for nexthop object in a fib_info
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
References: <20190607084256.GA380@mwanda>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <885df715-19ab-73eb-bd7d-da15a5244602@gmail.com>
Date:   Fri, 7 Jun 2019 07:54:01 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190607084256.GA380@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 6/7/19 2:42 AM, Dan Carpenter wrote:
> Hello David Ahern,
> 
> The patch 4c7e8084fd46: "ipv4: Plumb support for nexthop object in a
> fib_info" from Jun 3, 2019, leads to the following static checker
> warning:
> 
> 	net/ipv4/fib_semantics.c:1482 fib_create_info()
> 	error: we previously assumed 'nh' could be null (see line 1357)
> 

Thanks for the report. The patch in question is a prep patch; the
reported dead code will be made live in a followup set.

