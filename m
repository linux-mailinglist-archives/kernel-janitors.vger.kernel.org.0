Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C48DDB91A8
	for <lists+kernel-janitors@lfdr.de>; Fri, 20 Sep 2019 16:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387959AbfITOYr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 20 Sep 2019 10:24:47 -0400
Received: from muru.com ([72.249.23.125]:34008 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387938AbfITOYr (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Sep 2019 10:24:47 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B502E80AA;
        Fri, 20 Sep 2019 14:25:18 +0000 (UTC)
Date:   Fri, 20 Sep 2019 07:24:44 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        YueHaibing <yuehaibing@huawei.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctl: ti: iodelay: fix error checking on
 pinctrl_count_index_with_args call
Message-ID: <20190920142444.GP5610@atomide.com>
References: <20190920122030.14340-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920122030.14340-1-colin.king@canonical.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

* Colin King <colin.king@canonical.com> [190920 12:21]:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to pinctrl_count_index_with_args checks for a -EINVAL return
> however this function calls pinctrl_get_list_and_count and this can
> return -ENOENT. Rather than check for a specific error, fix this by
> checking for any error return to catch the -ENOENT case.

Acked-by: Tony Lindgren <tony@atomide.com>
