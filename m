Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42561126414
	for <lists+kernel-janitors@lfdr.de>; Thu, 19 Dec 2019 14:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfLSN5c (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 19 Dec 2019 08:57:32 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:38274 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbfLSN5b (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Dec 2019 08:57:31 -0500
Received: by mail-yw1-f68.google.com with SMTP id 10so2174053ywv.5
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Dec 2019 05:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1yn+mK/5xEg4fegs3phGOsQ7/Ct6TERF9p632E4MnVU=;
        b=Z+70zlfpfDFUhG4zCZN0o7aK311Wb9wqmTfhJspMn390U/L7t8E4FJKmpey+FMMx+m
         MTrrHYTduZesm6fol+ZJfFmbXUWIpqMnwaYzeIw4f74e8jT8uVqAV65Rga3P/rBzQz12
         t3fhOs6j8YhRorlFhHq64M1oHtQQOHmkXE/UgtMGS/SQwbqOXSNKOW3/cr9q2XF8EoaT
         S8zSoSXCT9OwRrk+rJUEubK+m3qxHSe5oZ1JUCTlhyjI8QrEfKD/sOXaX44xHEOlYR0P
         QJU5pdTCLdk9Pu7p6orkgIjjgAjT/7ZDfZ4a49i0E9kzIhy8mQRWWEl8xV8Bzxfk+rQo
         u7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1yn+mK/5xEg4fegs3phGOsQ7/Ct6TERF9p632E4MnVU=;
        b=g5p5hTByK8xrQfiKg0QtWoQc5aehRpSMu4KPJLLSVJ9RH+oNgcrpgeDadIvXYxu/bA
         jupTl0jN2jjcVXPIwtMiTfOGRjyS1Itm/unHD11oJe/kR3PSF6pQSk5rk9cP8n9P8X7l
         X5pY5DZEu1BglfFyu5OAaTivOqrsfHxTNoBHogHAbX/TLNrHDY6YP0GHF9bJY5GdCcSb
         tPA4zV394kUlcdAV0taBMJGTz6kmmB53oGefujTVfU56FUaqfJX7onQIepab/pJYoQra
         zIlOtFslHhzMoq+WMHvkguFBvxnzs/C/7JELrNapq9PSYqfGTIOrXgP+xqtM+fe9SpQc
         nfYQ==
X-Gm-Message-State: APjAAAU7Zy0EgqoPOxi9t9LBwiMVUzPvAUlKRZYtvFlCt0YnUTozjLzz
        z/I/rUpb6gcVC0FWNR0dKf+DwLQa
X-Google-Smtp-Source: APXvYqwCVAXxQiSJp1kjqXWtw+qZOPDl2MOyKSOtVVwqeQR+xy7pMHkWYbY0WeXNhzh/wYbEfYxrgA==
X-Received: by 2002:a81:3a06:: with SMTP id h6mr6268938ywa.170.1576763849474;
        Thu, 19 Dec 2019 05:57:29 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id e187sm2450546ywd.7.2019.12.19.05.57.27
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 05:57:28 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id x14so2193191ybr.4
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Dec 2019 05:57:27 -0800 (PST)
X-Received: by 2002:a5b:348:: with SMTP id q8mr6431302ybp.83.1576763847446;
 Thu, 19 Dec 2019 05:57:27 -0800 (PST)
MIME-Version: 1.0
References: <20191219013344.34603-1-maowenan@huawei.com>
In-Reply-To: <20191219013344.34603-1-maowenan@huawei.com>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Thu, 19 Dec 2019 08:56:50 -0500
X-Gmail-Original-Message-ID: <CA+FuTScgWi905_NhGNsRzpwaQ+OPwahj6NtKgPjLZRjuqJvhXQ@mail.gmail.com>
Message-ID: <CA+FuTScgWi905_NhGNsRzpwaQ+OPwahj6NtKgPjLZRjuqJvhXQ@mail.gmail.com>
Subject: Re: [PATCH net] af_packet: refactoring code for prb_calc_retire_blk_tmo
To:     Mao Wenan <maowenan@huawei.com>
Cc:     David Miller <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, maximmi@mellanox.com,
        Paolo Abeni <pabeni@redhat.com>, yuehaibing@huawei.com,
        Neil Horman <nhorman@tuxdriver.com>,
        Network Development <netdev@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Dec 18, 2019 at 8:37 PM Mao Wenan <maowenan@huawei.com> wrote:
>
> If __ethtool_get_link_ksettings() is failed and with
> non-zero value, prb_calc_retire_blk_tmo() should return
> DEFAULT_PRB_RETIRE_TOV firstly. Refactoring code and make
> it more readable.
>
> Fixes: b43d1f9f7067 ("af_packet: set defaule value for tmo")

This is a pure refactor, not a fix.

Code refactors make backporting fixes across releases harder, among
other things. I think this code is better left as is. Either way, it
would be a candidate for net-next, not net.

> -       unsigned int mbits = 0, msec = 0, div = 0, tmo = 0;
> +       unsigned int mbits = 0, msec = 1, div = 0, tmo = 0;

Most of these do not need to be initialized here at all, really.
