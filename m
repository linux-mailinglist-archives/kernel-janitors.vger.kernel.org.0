Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87D311D5F03
	for <lists+kernel-janitors@lfdr.de>; Sat, 16 May 2020 08:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725867AbgEPGWd (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 16 May 2020 02:22:33 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46802 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgEPGWd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 16 May 2020 02:22:33 -0400
Received: by mail-pl1-f196.google.com with SMTP id b12so1809824plz.13
        for <kernel-janitors@vger.kernel.org>; Fri, 15 May 2020 23:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=DR5Q9+4GeojYop/5HT61wPm8RvVngMMXJvhv4XhvBIvfzUFFLjv85RMgnHnmwCwHYA
         k3r+XgpqkEIChE/n64TYlXnK2A/uiOvqsvngBZpdUQY8SjEk+shV/hXw/W9R1Fm9TqHo
         dInjJWys8K1YetR9pB2TD1daSqoUlE2XFLYif+2ltFku942WK0wEhMQE5gD260Qiqh1V
         6uUYTerGAXbMIrBt4YJ0MKCSy9+wVk+ZGYrZoNMQ8K1Tt0WqpKDM2zmlYdWjn3oipqWk
         4C/2VeMgxA6plYMoIEoIweUsYaGD54SZxzxOY2MtUX0yU9jqLxf1Rq8XNyLB3vDnAB92
         4L1w==
X-Gm-Message-State: AOAM533MkaA+fIAV4EC1qnx6ij9vb7H+qPbC0tzzpYqQU55ARj9dWm1q
        VOtNpGtlE0yvz321wZgIaoAXMMK3Mi0=
X-Google-Smtp-Source: ABdhPJz2BE1zB/ORAu4hGfto+YCyIFr9JC4VW0K6jXndG7YtNAxj88GRQcp6qA55LYxOXfYuseEHeg==
X-Received: by 2002:a17:90a:e2d0:: with SMTP id fr16mr7351713pjb.146.1589610152130;
        Fri, 15 May 2020 23:22:32 -0700 (PDT)
Received: from ?IPv6:2601:647:4802:9070:e4f0:6472:2168:72ee? ([2601:647:4802:9070:e4f0:6472:2168:72ee])
        by smtp.gmail.com with ESMTPSA id l3sm2988724pjb.39.2020.05.15.23.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2020 23:22:31 -0700 (PDT)
Subject: Re: [PATCH] nvme: delete an unnecessary declaration
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Keith Busch <kbusch@kernel.org>
Cc:     Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
        linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20200515120659.GA575846@mwanda>
From:   Sagi Grimberg <sagi@grimberg.me>
Message-ID: <9be24a10-aad2-9101-3cd6-7365f76825a7@grimberg.me>
Date:   Fri, 15 May 2020 23:22:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515120659.GA575846@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
