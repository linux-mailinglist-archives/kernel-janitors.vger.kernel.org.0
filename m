Return-Path: <kernel-janitors+bounces-5217-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 276DD96B16B
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Sep 2024 08:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 598B91C23E95
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Sep 2024 06:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569EB12CD88;
	Wed,  4 Sep 2024 06:20:28 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id F35AB83A09
	for <kernel-janitors@vger.kernel.org>; Wed,  4 Sep 2024 06:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725430828; cv=none; b=LCfG/26IgrCeI1ho4jKmUaZmF6omhVm/EGZvEcevYrDFjQxOpVExALAOaNsD1RXjLD8+/7+0h3gQuteYtmJehRrRzXVYJQZsE6ittXCtcP6WrRvpkLtFmf0Fq8DAw4+ohzWwgBe/Dea85aWwRPEGWsUNym6AtK3oHw1PglsJRbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725430828; c=relaxed/simple;
	bh=fy929IoTYQhMMlC/XyibXOpsB8K6AOi104HNogjsQbk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=sdyJvePlat81msV7aLiXT/jDJbYrzOvpEz0Uc+C2X21jkXIRr/rhw6IXpNnIDACQGLsFobfexqRL+V6f7RLYVF94d9d5rJExxHDz1CDP8rzRiQXoGSR5+9BJUb72336UZcVxDu1zz7oKNEi9bI5ghjj1vrsg+hYOD763uBAr1PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [172.30.20.101] (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 99D386047A8DC
	for <kernel-janitors@vger.kernel.org>; Wed,  4 Sep 2024 14:20:17 +0800 (CST)
Message-ID: <a0294eec-723d-a564-9df3-9945ea2c6050@nfschina.com>
Date: Wed, 4 Sep 2024 14:20:17 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US
To: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
Subject: ping
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

ping test


