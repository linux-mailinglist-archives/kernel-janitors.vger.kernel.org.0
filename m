Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C817E41F70A
	for <lists+kernel-janitors@lfdr.de>; Fri,  1 Oct 2021 23:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354861AbhJAVoF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 1 Oct 2021 17:44:05 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:58559 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhJAVoE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 1 Oct 2021 17:44:04 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 931D26000B;
        Fri,  1 Oct 2021 21:42:18 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Colin King <colin.king@canonical.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtc: m41t80: return NULL rather than a plain 0 integer
Date:   Fri,  1 Oct 2021 23:42:17 +0200
Message-Id: <163312453101.8779.4064958677517172012.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925223441.182673-1-colin.king@canonical.com>
References: <20210925223441.182673-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 25 Sep 2021 23:34:41 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Function m41t80_sqw_register_clk returns a pointer to struct clk,
> so returning a plain 0 integer isn't good practice. Fix this by
> returning a NULL instead.
> 
> 
> [...]

Applied, thanks!

[1/1] rtc: m41t80: return NULL rather than a plain 0 integer
      commit: 7caadcfa8a7c6f8e754d982b99d959a222e7f863

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
